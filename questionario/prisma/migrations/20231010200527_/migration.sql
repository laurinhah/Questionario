-- CreateEnum
CREATE TYPE "Dificuldade" AS ENUM ('FACIL', 'MEDIO', 'DIFICIL');

-- CreateTable
CREATE TABLE "professor" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "professor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Questao" (
    "id" SERIAL NOT NULL,
    "enunciado" TEXT NOT NULL,
    "gabarito" BOOLEAN NOT NULL,
    "assunto_id" INTEGER NOT NULL,
    "dificuldade" "Dificuldade" NOT NULL,
    "professorId" INTEGER NOT NULL,

    CONSTRAINT "Questao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assunto" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "assunto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teste" (
    "id" SERIAL NOT NULL,
    "inicio" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fim" TIMESTAMP(3) NOT NULL,
    "pontuacao" INTEGER NOT NULL,
    "quantidade_questoes" INTEGER,
    "alunoId" INTEGER,
    "assuntoId" INTEGER NOT NULL,

    CONSTRAINT "Teste_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Questao" ADD CONSTRAINT "Questao_assunto_id_fkey" FOREIGN KEY ("assunto_id") REFERENCES "assunto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Questao" ADD CONSTRAINT "Questao_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teste" ADD CONSTRAINT "Teste_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teste" ADD CONSTRAINT "Teste_assuntoId_fkey" FOREIGN KEY ("assuntoId") REFERENCES "assunto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
