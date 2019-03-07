User.create email: 'roberto@grupoggv.com', password: 'amarelo123'
User.create email: 'ellen.moura@grupoggv.com', password: 'amarelo123'
User.create email: 'gabriela.busso@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'gabriel.fernandes@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'gustavo.resende@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'jardany.duarte@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'larissa@grupoggv.com', password: 'amarelo123'
User.create email: 'maria.vitoria@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'rafaela.soares@ggvconsultoria.com.br', password: 'amarelo123'
User.create email: 'tiago.mattos@ggvconsultoria.com.br', password: 'amarelo123'

Goal.create id: 1, name: 'Arrecadar 500kg de alimentos'

Act.create id: 1, name: 'Rede de contatos'
Act.create id: 2, name: 'Clientes'
Act.create id: 3, name: 'BNI'
Act.create id: 4, name: 'Thai Brasil'
Act.create id: 5, name: 'Mercado'

GoalRecord.create name: 'Rede de Contatos', goal_id: 1, act_id: 1, quantity: 50.0
GoalRecord.create name: 'Contatar Clientes', goal_id: 1, act_id: 2, quantity: 50.0
GoalRecord.create name: 'BNI', goal_id: 1, act_id: 3, quantity: 100.0
GoalRecord.create name: 'Thai Brasil', goal_id: 1, act_id: 4, quantity: 80.0
GoalRecord.create name: 'Ação Mercado', goal_id: 1, act_id: 5, quantity: 150.0
