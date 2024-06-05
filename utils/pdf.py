import fitz

def read_pdf(file_path, text_to_search, start_page=None, end_page=None):
    document = fitz.open(file_path)
    
    text = ""
    for page_num in range(1 if not start_page else start_page, document.page_count if not end_page else end_page):
        page = document.load_page(page_num)
        
        page_text = page.get_text("text")
        
        lines = page_text.split('\n')
        
        
        for i, line in enumerate(lines):
            if text_to_search in line:
                if i + 1 < len(lines):
                    next_line = lines[i + 1]
                    text += next_line + "\n"
    return text.split("\n")
