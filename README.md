Here's the improved **README.md home page** in clean Markdown format:

```markdown
# 🚀 PowerQuery Utilities

A growing library of **modular Power Query (M)** functions to accelerate your data transformation, cleaning, and automation workflows in **Power BI**.

---

## 📦 What's Inside

| Function | Description |
|----------|-------------|
| [`fx_CleanText`](./fx_CleanText/Readme.md) | 🌍 Cleans and formats names from global datasets — supports Unicode, smart casing, multilingual scripts, and more. |
| *(More functions coming soon...)* | ✨ Stay tuned for reusable modules for deduplication, date parsing, error tracing, and more. |

---

## 🧠 Why This Exists

Power Query is powerful but verbose.  
This repo provides **plug-and-play scripts** that are:

- 📏 Scalable for large datasets  
- 🧱 Modular and reusable  
- 🔍 Transparent and well-documented  
- 🧑‍💻 Easy to extend for custom scenarios

Whether you're a Power BI beginner or automation pro, this repo helps you skip the grunt work and focus on insights.

---

## 🚀 Getting Started

### ✅ Step 1: Install a Function
1. Open **Power Query Editor** in Power BI.  
2. Create a **Blank Query**.  
3. Paste the code from any `.pq` file (e.g. [`fx_CleanText.pq`](./fx_CleanText/fx_CleanText.pq)).  
4. Rename the query accordingly (e.g. `fx_CleanText`).  

### ✅ Step 2: Apply the Function to Your Data
Use in a **Custom Column** or via `Table.TransformColumns`:

```m
= Table.TransformColumns(Source, {{"Name", fx_CleanText, type text}})
```

---

## 🔍 Explore Functions by Use Case

| Category        | Available Functions                  |
|----------------|--------------------------------------|
| Text Cleaning   | [`fx_CleanText`](./fx_CleanText/Readme.md) |
| Coming Soon     | fx_RemoveDuplicates, fx_ParseDates, fx_FormatPhoneNumbers |

---

## 🤝 Contribute

Have a cool transformation script?  
Contributions are welcome! Submit a pull request with:

- 📎 A `.pq` file containing your function  
- 📝 A minimal README inside a subfolder with usage & examples  

---

## 📝 License

This project is open-source under the **MIT License**.  
Use it, fork it, ship it — just give credit where it’s due.

---

## 🌐 Resources

- [Microsoft Power Query Docs](https://learn.microsoft.com/en-us/power-query/)
- [Power BI Community Forum](https://community.powerbi.com/)
```

Let me know if you want a second version styled for light themes or a folder-specific `Readme.md` template!
