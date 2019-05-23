from rasa_nlu.training_data import load_data
from rasa_nlu.config import RasaNLUModelConfig
from rasa_nlu.model import Trainer
from rasa_nlu.model import Metadata, Interpreter
from rasa_nlu import config
from rasa_core.agent import Agent
from rasa_core.policies.memoization import MemoizationPolicy
from rasa_core.policies.keras_policy import KerasPolicy
from rasa_core.interpreter import RasaNLUInterpreter
from rasa_core.channels.socketio import SocketIOInput


#from rasa_core.channels.console import ConsoleInputChannel

def train():
    training_data = load_data("data/testData.json")
    trainer = Trainer(config.load("config/nlu_config.json"))
    trainer.train(training_data)
    model_directory = trainer.persist("./models/demo")
    print(model_directory)
    return model_directory

def predict(model_directory):
    interpreter = Interpreter.load(model_directory)

    print(interpreter.parse(u"你好啊"))

# def train_dialogue(domain_file, model_path, story_file):
#     agent = Agent(domain_file, policies=[MemoizationPolicy(), KerasPolicy()])
#     agent.train(story_file, max_history=3, epochs=400,batch_size=10,validation_split=0.2)
#     agent.persist(model_path)
#     return agent


# def train_dialogue_online(input_channel, interpreter, domain_file, training_data_file):
#     agent = Agent(domain_file, policies=[MemoizationPolicy(), KerasPolicy()], interpreter=interpreter)
#     agent.train_online(training_data_file, input_channel=input_channel,max_history=3, batch_size=50,epochs=200,max_training_samples=300)
#     return agent

def run():
    agent = Agent.load("models/current/dialogue")
    #agent.handle_channels();
    # agent.predict_next()
    input_channel = SocketIOInput(
        # event name for messages sent from the user
        user_message_evt="user_uttered",
        # event name for messages sent from the bot
        bot_message_evt="bot_uttered",
        # socket.io namespace to use for the messages
        namespace=None
    )
    s = agent.handle_channels([input_channel], 5500, serve_forever=True)
    #return agent.handle_text(str)

if __name__ == '__main__':
    # m_dir = train()
    # predict(m_dir)
    run()
