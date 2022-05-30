category = Category.create!(name: "Dança")
category.gym_classes.create!(name: "Zumba", description: "", teacher_name: "Pedro", start_time: Time.zone.now,
                             duration: 3600)
category.gym_classes.create!(name: "Street Dance", description: "", teacher_name: "João", start_time: 2.days.from_now,
                             duration: 3600)
category.gym_classes.create!(name: "Valsa", description: "", teacher_name: "Waliff", start_time: 2.days.ago,
                             duration: 3600)

category = Category.create!(name: "Musculação")
category.gym_classes.create!(name: "Abdominais", description: "", teacher_name: "Pedro", start_time: Time.zone.now,
                             duration: 3600)
category.gym_classes.create!(name: "Treino Muzy", description: "", teacher_name: "João", start_time: 2.days.from_now,
                             duration: 3600)
category.gym_classes.create!(name: "Treino Cariani", description: "", teacher_name: "Waliff", start_time: 2.days.ago,
                             duration: 3600)

category = Category.create!(name: "Luta")
category.gym_classes.create!(name: "Box", description: "", teacher_name: "Pedro", start_time: Time.zone.now,
                             duration: 3600)
category.gym_classes.create!(name: "Jiu", description: "", teacher_name: "João", start_time: 2.days.from_now,
                             duration: 3600)
category.gym_classes.create!(name: "Judo", description: "", teacher_name: "Waliff", start_time: 2.days.ago,
                             duration: 3600)
