import solara

@solara.component
def Page():
    solara.Style("""so
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
    }
    """)

    # Outer container fills viewport
    with solara.Div(
        style={
            "height": "100vh",
            "width": "100vw",
            "display": "flex",
            "flexDirection": "column",
            "justifyContent": "center",
            "alignItems": "center",
            "backgroundColor": "#FADA7A",
        }
    ):
        solara.Markdown("""
        <span style="color:#1C6EA4; font-size:72px; font-weight:bold; font-family: 'Arial', 'Helvetica', sans-serif;">Enti</span>
        <span style="color:#578FCA; font-size:72px; font-weight:bold; font-family: 'Arial', 'Helvetica', sans-serif;">Lytics</span>
        """)