# features/rss_handler.py

import feedparser
from datetime import datetime

def fetch_rss_articles(rss_url):
    """
    Fetch articles from an RSS feed
            
    Returns list of dictionaries with article info
    """
    
    print(f"Fetching RSS feed from: {rss_url}")
    
    try:
        # Parse the RSS feed
        feed = feedparser.parse(rss_url)
        
        # Check if feed loaded successfully
        if feed.bozo:  # bozo = feed has errors
            print("Warning: Feed may have issues")
        
        articles = []
        
        # Get articles
        for entry in feed.entries:
            
            # Extract article info
            article = {
                'title': entry.get('title', 'No Title'),
                'description': entry.get('description', ''),
                'link': entry.get('link', ''),
                'published': entry.get('published', 'Unknown date'),
                'source': rss_url
            }
            
            articles.append(article)
        
        print(f"Fetched {len(articles)} articles") # See how many articles were fetched
        return articles
        
    except Exception as e:
        print(f"Error fetching RSS feed: {e}")
        return []
