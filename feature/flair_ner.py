from flair.data import Sentence
from flair.nn import Classifier

def identify_entities():
    # load NER model, use 'ner-fast' for a smaller but faster BiLSTM model
    tagger = Classifier.load('ner')

    # get user input
    sentence = Sentence(input("Enter a sentence to identify entities: "))

    # predict entities
    tagger.predict(sentence)

    print("\nIdentified Entities:")
    if not sentence.get_spans('ner'): # if there are no entities extracted
        print("No entities found.")
    else: # output of predicted entities with label and confidence score
        for entity in sentence.get_spans('ner'):
            print(f"- {entity.text} [{entity.get_label('ner').value}] (Confidence: {entity.get_label('ner').score:.2f})")

if __name__ == "__main__":
    identify_entities()

    
