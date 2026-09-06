---
name: card-to-vcf
description: Extract contacts from a scanned PDF containing one or more business cards, reconcile card fronts and backs plus Chinese/English details, obtain user confirmation, then generate a Google Contacts-ready vCard 3.0 file.
---

# Card to VCF

Turn scanned business-card PDFs into reviewed contact records and, only after the user explicitly confirms, a Google Contacts-compatible `.vcf` file.

## Workflow

### 1. Inspect and extract

- Render and visually inspect every PDF page. A page may contain multiple cards; treat each separate card region as a candidate side, not as one contact.
- Extract Chinese and English names, organization, title, phone numbers and extensions, fax, email, address, URL, and other useful details. Preserve the source wording where OCR confidence is low and flag it rather than guessing.
- Reconcile front/back pairs using strong evidence such as a shared name, email, phone, company, card layout, sequence, or an explicit user convention. A back may be on a later page. Do not merge merely because two cards are adjacent.
- Keep Chinese and English variants distinct until VCF formatting. If correspondence is ambiguous, create separate candidates or note the ambiguity for the user.

### 2. Present a reviewable preview

Before producing any VCF, list every contact in Markdown using exactly this structure:

```markdown
【聯絡人 #序號】

- 中文全名：
- 英文全名：
- 公司名稱：
- 職稱：
- 手機 (CELL)：
- 公司電話 (WORK) / 分機：
- 傳真 (FAX)：
- Email：
- 地址：
- 網站 (URL)：
- 備註 / 正反面判斷說明：

---
```

Then ask verbatim: 「以上資訊是否需要修改或補充？確認無誤請回覆『確認產出』，若有需調整的項目請直接告知。」

### 3. Apply corrections

Apply the user's requested corrections, additions, splits, or merges and show the revised records again. Repeat until the user replies `確認產出` or gives equally unambiguous approval to create the file.

### 4. Generate vCard 3.0

Create a downloadable UTF-8 `.vcf` file after confirmation when the environment supports file output. If it does not, provide the complete VCF in one clearly labeled `vcf` code block and state that the user must save it as a UTF-8 `.vcf` file. Use `BEGIN:VCARD`, `VERSION:3.0`, and `END:VCARD` for every contact.

- **Chinese + English name:** `FN:中文全名 英文全名`; `N:英文姓氏;英文名字;;;`; `X-PHONETIC-LAST-NAME:中文姓氏`; `X-PHONETIC-FIRST-NAME:中文名字`; `NICKNAME:中文全名 英文全名`.
- **Chinese-only name:** `FN:中文全名`; `N:中文姓氏;中文名字;;;`.
- **English-only name:** `FN:英文全名`; `N:英文姓氏;英文名字;;;`.
- For company, title, and address that have both variants, join them as `中文 (English)` in one value. Use `ORG:`, `TITLE:`, and `ADR;TYPE=WORK:;;地址;;;` respectively.
- Use `TEL;TYPE=CELL:`, `TEL;TYPE=WORK:`, `TEL;TYPE=FAX:`, `EMAIL;TYPE=INTERNET,WORK:`, and `URL:` when the corresponding data exists. Put an extension in the work-phone value or a clearly labeled note when that preserves it best.
- Escape vCard text values: backslash as `\\`, semicolon as `\;`, comma as `\,`, and line break as `\n`. Fold lines longer than 75 octets using vCard 3.0 continuation syntax. Omit fields without a value.
- Do not invent an English surname/given-name split. If it cannot be inferred reliably, preserve the name in `FN` and explain the issue during review; ask the user to resolve it before finalizing if the `N` field would otherwise be misleading.

Tell the user that the finished file can be imported in Google Contacts through **Import**, and state the generated filename and record count.
