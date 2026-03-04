import markdown


def markdown_to_html(md_text: str) -> str:
    html = markdown.markdown(md_text)
    return html