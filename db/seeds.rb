Tag.delete_all
Cstrength.delete_all
User.delete_all
Question.delete_all

users = [
  {first_name:'Alice',
   email: 'alice@alice.com',
   phone_number: "18001234567",
   password: 'alice'},

  {first_name: 'David',
   email: 'david@david.com',
   phone_number: "18001234567",
   password: 'david'},

  {first_name:'George',
   email: 'george@george.com',
   phone_number: "18001234567",
   password: 'george'},

  {first_name:'Gregor',
   email: 'gregor@gregor.com',
   phone_number: "18001234567",
   password: 'gregor'}
]

tags = [
  {
    name: "Wisdom",
    description:"Wisdom deals with strengths that involve the way we acquire and use knowledge."
  },

  {name: "Courage",
   description:"Courage describes strengths that deal with overcoming fear. These strengths can manifest themselves inwardly or outwardly as they are composed of cognitions, emotions, motivations and decisions."
  },

  {name: "Humanity",
   description:"Humanity describes strengths that manifest in caring relationships with others. These strengths are interpersonal and are mostly relevant in one-on-one relationships."
  },

  {name: "Justice",
   description:"Justice describes strengths that make life fair. They are broadly interpersonal and describe the best interaction between the individual and a group or community."
  },

  {name: "Temperance",
   description:"Temperance deals with strengths that protect us from excess. It is the practiced ability to monitor and manage one's emotions, motivation and behavior in the absence of outside help."
  },

  {name: "Transcendence",
   description:"Transcendence describes strengths that provide a broad sense of connection to something higher in meaning and purpose than ourselves."
  }
]

prompts= [
  {
    name:"Creativity",
    description: "Thinking of novel and productive ways to conceptualize and do things; includes artistic achievement but is not limited to it.",
    concepts:"There are two essential components to Creativity- originality and adaptiveness. A creative individual generates ideas or behaviors that are novel or unusual and these make a positive contribution to the individual's life or the lives of others.",
    tag_id:1,
    exercise1: "When facing a problem, define the issue clearly and then practice divergent thinking (ex: developing multiple solutions/outcomes rather than just one solution).",
    exercise2: "Set time aside each day for creative thinking or creative activities (such as: writing poems or using an everyday household object in a new way)",
    motto: "Do Things in a Different Way.",
  },

  {
    name:"Curiosity",
    description:"Taking an interest in ongoing experience for its own sake; finding subjects and topics fascinating; exploring and discovering.",
    concepts:"There are two key components to curious individuals: They are interested in exploring new ideas, activities and experiences, and they also have a strong desire to increase their own personal knowledge.",
    tag_id: 1,
    exercise1:"Consider an activity you dislike. Pay attention to 3 novel features of this activity while you do it.",
    exercise2:"Practice active curiosity and explore your current environment, paying attention to anything you may often ignore or take for granted.",
    motto:"Ask Questions, Lots of Them.",
  },

  {
    name:"Judgment",
    description:"Thinking things through and examining them from all sides; not jumping to conclusions; being able to change one’s mind in light of evidence; weighing all evidence fairly.",
    concepts:"The strength of judgment is a corrective strength in that it counteracts faulty thinking, such as favoring your current views or favoring ideas that are considered the dominant view, and therefore giving less attention to the less-dominant view. It is the willingness to search actively for evidence against your favored beliefs, plans or goals and to weigh all of the evidence fairly when it is available.",
    tag_id:1,
    exercise1:"Examine a past event that you are not happy with (not following through with a goal) and brainstorm ideas for other ways that you could have approached that event/activity.",
    exercise2:"Play devil’s advocate on an issue that you have strong opinions about.",
    motto:"Examine the details",
  },

  {
    name:"Love Of Learning",
    description:"Mastering new skills, topics, and bodies of knowledge, whether on one’s own or formally; obviously related to the strength of curiosity but goes beyond it to describe the tendency to add systematically to what one knows.",
    concepts:"Love of learning describes the way in which a person engages new information and skills. Love of learning is a strength that teachers would like to see in their students, parents want to encourage in their children, therapists support in their clients, and employers try to foster in their employees. It has important motivational consequences because it helps people persist through challenges, setbacks and negative feedback.  ",
    tag_id:1,
    exercise1:"Deliberately learn five new words, including their meaning and usage.",
    exercise2:"Follow an ongoing global event through newspapers, TV or internet.",
    motto:"Learn something from every situation.",
  },

  {
    name:"Perspective",
    description:"Being able to provide wise counsel to others; having ways of looking at the world that make sense to oneself and to other people.",
    concepts:"Perspective is distinct from intelligence but represents a high level of knowledge, the capacity to give advice and to recognize and weight multiple sides before making decisions. It allows the individual to address important questions about the conduct and meaning of life.",
    tag_id:1,
    exercise1:"Read quotes on wisdom, find one that resonates and then re-write it to make it your own and put it to memory. Try to think about ways that you can live more true to that quote.",
    exercise2:"Find someone wise (alive or someone who has passed on), read or watch a film on their life, and identify how their life can guide your decisions and actions.",
    motto:"Offer good advice.",
  },

  {
    name:"Bravery",
    description:"Not shrinking from threat, challenge, difficulty, or pain; speaking up for what is right even if there is opposition; acting on convictions even if unpopular; includes physical bravery but is not limited to it.",
    concepts:"There are three types of bravery (an individual may possess one of these or a combination): 1. Physical bravery (e.g., firefighters, police officers, soldiers) 2. Psychological bravery (e.g., facing painful aspects of oneself) 3. Moral bravery (e.g., speaking up for what's right, even if it's an unfavorable opinion to a group)",
    tag_id:2,
    exercise1: "Identify an area in which you generally shy away from confrontations.  Practice the phrases, the tones, and the mannerisms that will enable you to effectively confront the situation next time.",
    exercise2: "Don’t be afraid to befriend someone who is different but positive.",
    motto: "Face what you are afraid of.",
  },

  {
    name:"Perseverance",
    description:"Finishing what one starts; persisting in a course of action in spite of obstacles; 'getting it out the door'; taking pleasure in completing tasks.",
    concepts:"Perseverance involves the voluntary continuation of a goal-directed action despite the presence of challenges, difficulties, and discouragement. There are two vectors of perseverance. It requires both effort for a task and duration to keep the task up. ",
    tag_id:2,
    exercise1:"Keep a checklist of things to do and regularly update it.",
    exercise2:"Select a role-model who exemplifies perseverance and determine how you can follow her/his footsteps.",
    motto:"Don't Give Up.",
  },

  {
    name:"Honesty",
    description:"Speaking the truth but more broadly presenting oneself in a genuine way and acting in a sincere way; being without pretense; taking responsibility for one’s feelings and actions.",
    concepts:"This strength involves accurately representing your internal states, intentions, and commitments, both publicly and privately. The strength of honesty is often linked to self-concordance- the extent to which your goals accurately represent your implicit interests and values. Honesty allows people to take responsibility for their feelings and behaviors, owning them, and reaping benefits by doing so.",
    tag_id:2,
    exercise1:"The next time you are asked for advice, give constructive, direct and authentic feedback.",
    exercise2:"Honor your commitments in all of your relationships. If you agree to do something or schedule a time to meet with someone, be reliable and follow through.",
    motto:"Tell people the truth, (almost) all the time.",
  },

  {
    name:"Zest",
    description:"Approaching life with excitement and energy; not doing things halfway or halfheartedly; living life as an adventure; feeling alive and activated.",
    concepts:"Zest is a dynamic strength that is directly related to physical and psychological wellness. This strength has the strongest ties to overall life satisfaction and a life of engagement.",
    tag_id:2,
    exercise1:"Do a physically rigorous activity (bike riding, running, sports singing, playing) that you always wanted to do but have not done yet.",
    exercise2:"Call an old friend and reminisce good old times.",
    motto:"When in doubt, take action!",
  },

  {
    name:"Love",
    description:"Valuing close relations with others, in particular those in which sharing and caring are reciprocated; being close to people.",
    concepts:"There are four types of love, each with a biological and evolutionary base: 1. Attachment love: parent for child; child for parent 2. Compassionate/altruistic love: kindness 3. Companionate love: friendship 4. Romantic love: spouse/partner/boyfriend/girlfriend",
    tag_id:3,
    exercise1:"Convey love at work by making an effort to understand who you're working with, finding out what is important to them and engaging with them on the topic regularly.",
    exercise2:"Engage in a favorite activity with a loved one (e.g., hiking, going to an amusement park, biking, walking in the park, swimming, camping, jogging).",
    motto:"Be a warm and strong listener.",
  },

  {
    name:"Kindness",
    description:"Doing favors and good deeds for others; helping them; taking care of them.",
    concepts:"Kind individuals believe that others are worthy of attention and affirmation for their own sake as human beings, not out of s sense of duty or principle. There are three traits of altruistic personalities: 1. Empathy/sympathy 2. Moral reasoning 3. Social responsibility",
    tag_id:3,
    exercise1:"Say kinder and softer words to people when interacting through email, writing letters, talking on phone. Smile when answering the phone and sound happy to hear from the person on the other end of the line.",
    exercise2:"Perform a random act of kindness each day (ex: slowing to allow a car in front of you, complimenting a co-worker, buying a treat for your partner)",
    motto:"Be helpful, err toward caring.",
  },

  {
    name:"Social Intelligence",
    description:"Being aware of the motives and feelings of other people and oneself; knowing what to do to fit into different social situations; knowing what makes other people tick.",
    concepts:"Social intelligence involves two general components: 1. Social awareness: what we sense about others 2. Social facility: what we do with our awareness",
    tag_id:3,
    exercise1:"Practice noticing, labeling and expressing emotions. After you become aware of an emotion, label it, and if appropriate, express it to another.",
    exercise2:"Watch a favorite TV program or film muted and write feelings observed.",
    motto:"Be friendly.",
  },

  {
    name:"Teamwork",
    description:" Working well as a member of a group or team; being loyal to the group; doing one's share.",
    concepts:"Teamwork is closely related to 3 other concepts: 1. Citizenship: responsibility toward one's community 2. Loyalty: unwavering trust for a group 3. Patriotism: loyalty toward one's homeland/nation without hostility toward other nations.",
    tag_id:4,
    exercise1:"Help someone close to you set a goal and then periodically check on their progress.",
    exercise2:"Start a book club with family members, friends or colleagues. Schedule a time to meet and discuss the selected books.",
    motto:"Work side-by-side with others.",
  },

  {
    name:"Fairness",
    description:"Treating all people the same according to notions of fairness and justice; not letting personal feelings bias decisions about others; giving everyone a fair chance.",
    concepts:"Fairness is a cognitive judgment capacity that involves reasoning and making judgments. It involves 2 types of reasoning: 1. Justice reasoning which emphasizes logic and weighing principles to determine moral rights and responsibilities. 2. Care reasoning which includes empathy and compassion; the ability to put yourself in somebody else's shoes.",
    tag_id:4,
    exercise1:"Self-monitor to see whether you think about or treat people of other ethnicities and cultures stereotypically.",
    exercise2:"The next time you make a mistake, self-monitor to see whether you admit it.",
    motto:"Treat people the way you want to be treated.",
  },

  {
    name:"Leadership",
    description:"Encouraging a group of which one is a member to get things done and at the time maintain time good relations within the group; organizing group activities and seeing that they happen.",
    concepts:"Leadership is a social phenomenon that can be distinguished into two areas: 1. Practice- defining, establishing, identifying or translating direction 2. Personal quality- the motivation and capacity to seek out, attain and carry out leader roles. There are two types of leaders: 1. Transactional leaders- this type of leader clarifies responsibilities, expectations, and the tasks to be accomplished. 2. Transformational leaders- this leader motivates their followers to perform at an extremely high level, fostering a climate of trust and commitment to the organization and its goals.",
    tag_id:4,
    exercise1:"When two people are in an argument, mediate by inviting others to share their thoughts and emphasizing problem solving.",
    exercise2:"Read a biography and/or watch film of your favorite leader and evaluate how he/she inspires you in practical ways.",
    motto:"Organize activities for others.",
  },

  {
    name:"Forgiveness",
    description:"Forgiving those who have done wrong; accepting the shortcomings of others; giving people a second chance; not being vengeful.",
    concepts:"It is important to distinguish forgiveness from: 1. condoning (removes the offense) 2. forgetting (removes the awareness) 3. reconciliation (restores the relationship). Instead forgiveness is a strength that we employ to protect ourselves from the feeling of hatred. It is a specialized form of mercy; a general concept of feeling kindness and compassion towards others. ",
    tag_id:5,
    exercise1:"Take 20 minutes and write about the personal benefits that resulted from a negative incident.",
    exercise2:"Think of someone who wronged you recently. Put yourself in their shoes and try to understand their perspective.",
    motto:"Let It Go.",
  },

  {
    name:"Humility",
    description:"Letting one’s accomplishments speak for themselves; not regarding oneself as more special than one is.",
    concepts:"A common misconception is that humility involves having a low self-esteem, a sense of unworthiness, and/or a lack of self-focus. However, true humility involves an accurate self-assessment, recognition of limitations, keeping accomplishments in perspective, and forgetting of the self. Humble people do not distort information to defend or verify their own image, and they do not need to see-or present- themselves as being better than they actually are. ",
    tag_id:5,
    exercise1:"Admit your mistakes and apologize even to those who are younger than you.",
    exercise2:"Notice if you speak more than others in a group situation.",
    motto:"Place attention on others.",
  },

  {
    name:"Prudence",
    description:"Being careful about one's choices; not taking undue risks; not saying or doing things that might later be regretted",
    concepts:"Prudence involves far-sighted planning as well as short-term, goal-directed planning. It is often referred to as cautious wisdom, practical wisdom, and practical reason. ",
    tag_id:5,
    exercise1:"Think twice before saying anything. Do this exercise at least ten times a week and note its effects.",
    exercise2:"Remove all extraneous distractions before your make your next three important decisions.",
    motto:"Think before you act.",
  },

  {
    name:"Self-Regulation",
    description:"Regulating what one feels and does; being disciplined; controlling one's appetites and emotions.",
    concepts:"Self-Regulation can be viewed as a resource that can be depleted and fatigued. A useful metaphor can be that self-regulation acts like a muscle, which can be exhausted through over-exertion or strengthened through regular practice. ",
    tag_id:5,
    exercise1:"Next time you get upset, make a conscious effort to control your emotions and focus on positive attributes.",
    exercise2:"Set goals to improve your everyday living (e.g., room cleaning, laundry, doing dishes, cleaning your desk) and make sure you complete the tasks.",
    motto:"Manage your feelings.",
  },

  {
    name: "Appreciation Of Beauty",
    description:"Noticing and appreciating beauty, excellence, and/or skilled performance in various domains of life, from nature to art to mathematics to science to everyday experience.",
    concepts: "There are three types of goodness for which individuals high in Appreciation of Beauty and Excellence are responsive to: 1. Physical beauty. This may be visual, auditory, tactile, or abstract. This type of goodness produces awe and wonder in the individual experiencing it. 2. Skill or talent (excellence). This is often energizing, and makes the individual want to pursue their own goals. It produces admiration. 3. Virtue or moral goodness (moral beauty). Virtual goodness makes the individual want to be better, more loving, and produces feelings of elevation.",
    tag_id: 6,
    exercise1:"Keep a 'beauty log.' When you believe you are seeing something beautiful- whether it is from nature, is human-made (e.g.,artwork), or is the virtuous behavior of others- write it down. Describe the beauty in a few sentences.",
    exercise2: "Get regular exposure to green space in your environment, especially if you live/work in an urban setting.",
    motto: "Find beauty in nature, art, ideas, and people.",
  },

  {
    name:"Gratitude",
    description:"Being aware of and thankful for the good things that happen; taking time to express thanks.",
    concepts:"There are two types of gratitude: 1. Benefit-triggered gratitude=the state that follows when a desired benefit is received from a benefactor. 2. Generalized gratitude=the state resulting from awareness and appreciation of what is valuable and meaningful to yourself. There are two stages of gratitude: 1. Acknowledging the goodness in your life. 2. Recognizing the source of this goodness is outside yourself.",
    tag_id:6,
    exercise1:"Write down three good things that you are grateful for each day.",
    exercise2:"Set aside at least ten minutes every day to savor a pleasant experience.",
    motto:"Tell people 'thank you' often",
  },

  {
    name:"Hope",
    description:"Expecting the best in the future and working to achieve it; believing that a good future is something that can be brought about.",
    concepts:"Optimism is closely linked with having a particular explanatory style (how we explain the causes of bad events). People using an optimistic explanatory style interpret events as external, unstable and specific. Those using a pessimistic explanatory style interpret events as internal, stable and global. ",
    tag_id:6,
    exercise1:"Write an internal movie that features one of your goals. Picture yourself overcoming the obstacles, developing pathways around and through problems, to reach your goal. ",
    exercise2:"Write about a good event and why it will last and spread. How is this event linked to your actions?",
    motto:"Be positive, especially when others are not.",
  },

  {
    name:"Humor",
    description:"Liking to laugh and tease; bringing smiles to other people; seeing the light side; making (not necessarily telling) jokes.",
    concepts:"Humor involves the ability to make other people smile or laugh. It also means having a composed and cheerful view on adversity that allows an individual to see its light side and thereby sustain a good mood.",
    tag_id:6,
    exercise1:"Think about a past event in which you used humor for your benefit and the benefit of others.",
    exercise2:"Write down the humor of your everyday life. Each day make a conscious effort to be aware of your sense of humor, others' sense of humor, funny situations, and clever comments and record them in a daily journal.",
    motto:"Laugh a lot, with others.",
  },

  {
    name:"Spirituality",
    description:"Having coherent beliefs about the higher purpose and meaning of the universe; knowing where one fits within the larger scheme; having beliefs about the meaning of life that shape conduct and provide comfort.",
    concepts:"Spirituality is believed to describe both the private, intimate relationship between humans and the divine, and the range of virtues that result from the relationships. Spirituality is universal. Although the specific content  of spiritual beliefs varies, all cultures have a concept of an ultimate, transcendent, sacred force.",
    tag_id:6,
    exercise1:"When experiencing trauma or a difficult situation, look for the deeper meaning and purpose of the experience.",
    exercise2:"Build in spiritual tools as a regular practice (ex: prayer, meditation, exploring nature) or as a way of approaching life (ex: giving charity, showing compassion to less fortunate individuals).",
    motto:"Look for what is sacred in this moment.",
  }
]

questions = [
  {body:"How did you apply today's intention?"},
  {body:"How did you feel focussing on this intention?"},
  {body:"How will this intention influence you in the future?"}
]

Question.create!(questions)
User.create!(users)
Tag.create!(tags)
Cstrength.create!(prompts)
