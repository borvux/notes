# Why Ruby and Rails?

### Source: https://github.com/dpi-tta-slides/sdf-why-rails

### Slides: https://dpi-tta-slides.github.io/sdf-why-rails/

## **Slide 1: Why Rails?**

"Good morning, everyone. Today, we're going to look at the 'why' behind a significant part of your learning journey here. We'll be answering the question: 'Why Ruby and, eventually, Why Rails?' We'll explore why these technologies are a powerful choice for building modern web applications and how your current intro course is setting you up for success for our full stack web program that follows after."

## **Slide 2: Ancestry**

"To understand the philosophy here, let's start with an analogy from biology. Human and chimpanzee DNA is about 98% the same. A very small fraction of our DNA is what makes us distinct. We share so much DNA because we have a common ancestor from millions of years ago."

## **Slide 3: Ancestry**

"Believe it or not, the same principle applies to web applications. Major sites like **X** (formerly Twitter), **Shopify**, **GitHub**, and **Airbnb** share a significant portion of their core code. Most applications need the same fundamental components: a web server, a way to talk to a database, a method for rendering HTML, and so on. It's only a small part of their code that makes them unique."

## **Slide 4: (Rails Logos)**

"And the common ancestor for many of these successful companies is a framework built on a language you are learning right now: Ruby."

## **Slide 5: History**

"Let's go back to 2003. A company hired a developer named David Heinemeier Hansson, or DHH, to build a project management tool. DHH chose to use a programming language called Ruby."

## **Slide 6: History**

"He didn't just stumble upon it. He chose Ruby specifically for its elegant and readable syntax, which emphasizes developer happiness and productivity. As he built the application, he extracted the common, reusable parts and released them as the open-source framework, **Ruby on Rails**."

## **Slide 6: Why Start with Ruby?**

"So before we even get to Rails, let's talk about the language at its heart, which is the focus of your current intro course. Why is learning Ruby so important?

* **A Pure Object-Oriented Language:** In Ruby, *everything* is an object—even simple numbers and text. This makes it one of the best languages for truly understanding Object-Oriented Programming, a paradigm that powers almost all modern software. What you learn here applies everywhere.

* **Designed for Humans:** Ruby was created with 'The Principle of Least Surprise' in mind. It aims to be intuitive and readable, almost like plain English. This lets you focus on learning programming logic and problem-solving instead of getting bogged down by complex syntax.

* **A Stepping Stone to Mastery:** It’s the foundation. You can't build a strong house on a weak foundation. A deep understanding of Ruby is what will eventually allow you to master more complex tools like Rails."

## **Slide 6: And Why Sinatra?**

"So in this course, you're using Ruby with the Sinatra framework. A great way to think about this is to compare it to learning how to drive.

**Talk about questions from the MBA students**

* **Sinatra is like learning to drive a simple, manual-transmission car.** It might not be the biggest or fanciest car, but it forces you to learn the fundamentals. You have to work the clutch, listen to the engine, and know exactly when to shift gears. You are in direct control and you feel everything the car is doing. It's not magic; it's mechanics, and you have to understand them to get where you're going.

* **Rails, which you'll learn later, is like a massive, modern eighteen-wheeler truck.** It’s incredibly powerful, built to do heavy-duty work, and it's loaded with automation. It has power steering, cruise control, and an automatic transmission that handles all the gear shifting for you. This 'magic' lets you stop thinking about the mechanics and focus on the real job: hauling cargo from point A to point B.

Now, could you learn to drive the truck without ever driving the car? Maybe. But by learning the manual car first, you gain a deep, fundamental understanding of how a vehicle works. You're not just a button-pusher. You appreciate what the automatic transmission is doing for you, and you're a better driver for it.

That's what you're doing right now with Sinatra. You're learning the 'manual transmission' of web development. It's a crucial step that will make you a much stronger and more effective developer when you get behind the wheel of Rails."

## **Slide 7: Our Hack**

"So, when you eventually move to Rails, you're not just using a tool blindly. You're leveraging your fundamental knowledge of Ruby and web mechanics. You're using code built by DHH and thousands of contributors, standing on the shoulders of giants, and you'll actually understand how the giant is standing."

## **Slide 8: Why Rails? **

"So, when you get to the next course, our Full Stack Web program, why will you be learning Rails? Because it builds on the Ruby principles you're learning now and takes them to the next level:

* **Optimizes for Programmer Happiness:** Inherited directly from Ruby.
* **Convention over Configuration:** This is the 'magic' you'll appreciate after working with Sinatra.
* **Integrated System (Full-stack):** It handles everything, from the front-end (like the HTML and CSS you're learning) to the back-end.
* **One Person Framework:** It empowers a single developer, skilled in the fundamentals, to build incredible things.
* **And more!**"

## **Slide 9: Play the whole game**

"This brings us to the idea of 'playing the whole game.' To be an effective developer, you need to understand the entire process of building and deploying an application. This is what we call being a 'full-stack' developer. Your journey is structured to get you there: you start with the core components—Ruby, HTML, CSS, and web fundamentals with Sinatra—and then you'll move on to assembling them with a powerful framework like Rails."

## **Slide 10: Play the whole game**

"In the world of web development, we often refer to these full-stack applications as 'monoliths.' Rails is a perfect example of a monolithic framework that handles everything from the front-end to the database. The journey you are on—mastering Ruby and Sinatra first—is the best possible preparation for wielding the power of a monolithic framework like Rails."

## Slide 11: (T-Shaped Skills)

"This 'full-stack' approach helps you develop what are known as 'T-shaped skills.' You'll gain a broad understanding of the entire software development lifecycle, while also having the opportunity to develop deep expertise in specific areas that you find interesting and marketable."

## Slide 12: Convention over configuration

"Let's talk more about 'Convention over Configuration.' This is a core principle of Ruby. By providing sensible defaults and conventions, Ruby reduces the number of trivial decisions you have to make. This frees up your mental energy to focus on what really matters: solving your users' problems."

## Slide 13: Convention over configuration (skip)

"A simple example is database primary keys. You could name your primary key column 'id', 'postId', 'posts_id', or something else. As long as you're consistent, it doesn't really matter. Rails makes this decision for you by convention, so you don't have to think about it."

## Slide 14: Convention over configuration (skip)

"Here’s a more concrete example from what we've learned about routing. If you follow Rails' naming conventions, you can write a lot less code. In this example, you don't need to explicitly tell Rails to render the `home.html.erb` template. It automatically looks for a template in `views/pages/` that matches the controller action name, which in this case is `home`."

## Slide 15: One Person Framework

"DHH has called Rails 'The One-Person Framework' because it makes it possible for a single developer to create, deploy, and maintain a sophisticated web application. This is more relevant than ever. As Sam Altman, the founder of OpenAI, has said, 'AI will make it possible for one person to build a billion-dollar company very soon.' Frameworks like Rails are the perfect tool to leverage that power."

## **Slide 16: Programmer Happiness**

"Let's come back to this core tenet of **Ruby**: 'Programmer Happiness' and 'The Principle of Least Surprise.' This isn't a feature of a framework; it's a feature of the language you are learning right now. For example, in the interactive Ruby console (`irb`), if you want to exit, you can type either `exit` or `quit`. Ruby understands your intent. This is a small thing, but it shows a deep respect for the developer's time and mental energy."

## **Slide 17: Programmer Happiness**

"Ruby's helpful error messages are another example of this philosophy. This is a benefit you get *right now* while writing your Ruby and Sinatra apps. The language tries to help you solve your own problems. Remember to read the error messages!"

## **Slide 18: Java**

"To appreciate the concise power of Ruby, let's look at 'Hello, World!' in Java. You have a lot of boilerplate code you have to write just to get started. You need to compile it, then run it."

## **Slide 19: Ruby**

"Now, here's the same program in Ruby. One line. This is the simplicity that allows you, as a learner, to focus on the core logic of your program, which is why it's such a fantastic language for learning the fundamentals."

## Slide 20: Rails Doctrine

"Many of the ideas we've discussed are part of what's known as the 'Rails Doctrine.' This is a set of principles that guide the development of the framework. I highly recommend reading it to get a deeper understanding of the philosophy behind Rails."

## Slide 21: Setup for Career Success

"So, to summarize, learning Rails is a great way to set yourself up for career success. It reduces the friction of getting started, allows you to 'play the whole game' of web development, and helps you develop a taste and feel for what it's like to build real-world applications."

## Slide 22: Questions?

"And with that, I'd be happy to answer any questions you may have."

## Slide 23: References

"Finally, here are some resources if you'd like to learn more about the history and philosophy of Ruby on Rails."
