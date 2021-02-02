const EXAM_WEIGHT = 0.65;
const EXERCISE_WEIGHT = 0.35;
const A_THRESHOLD  = 93;
const B_THRESHOLD  = 85;
const C_THRESHOLD  = 77;
const D_THRESHOLD  = 69;
const E_THRESHOLD  = 60;

const sum = (values) => values.reduce((acc, total) => acc + total);
const average = (values) => sum(values) / values.length;
function transpose(twoDimensionalArray) {
  let result = [];
  twoDimensionalArray.forEach(row => {
    row.forEach((cell, colIndex) => {
      if(result[colIndex] === undefined) {
        result[colIndex] = [cell];
      } else {
        result[colIndex].push(cell);
      }
    });
  });
  return result;
}

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function formatGrade(numberGrade) {
  let letterGrade;
  if (numberGrade > A_THRESHOLD) {
    letterGrade = 'A';
  } else if (numberGrade > B_THRESHOLD) {
    letterGrade = 'B';
  } else if (numberGrade > C_THRESHOLD) {
    letterGrade = 'C';
  } else if (numberGrade > D_THRESHOLD) {
    letterGrade = 'D';
  } else if (numberGrade > E_THRESHOLD) {
    letterGrade = 'E';
  } else {
    letterGrade = 'F';
  }
  return `${numberGrade} (${letterGrade})`
}

function studentGrade(scoreData) {
  let examScore = average(scoreData.exams); 
  let exerciseScore = sum(scoreData.exercises);
  let numberGrade = Math.round(examScore * EXAM_WEIGHT + exerciseScore * EXERCISE_WEIGHT);
  return formatGrade(numberGrade);
}


function examReport(examScores) {
  return {
    average: average(examScores),
    minimum: Math.min(...examScores),
    maximum: Math.max(...examScores),
  };
}

function examSummary(examData) {
  let exams = transpose(examData);
  let studentCount = examData.length;
  return exams.map(examReport);
}

function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);
  return {
    studentGrades: scoreData.map(studentGrade),
    exams: examSummary(examData),
  };
}

console.log(generateClassRecordSummary(studentScores));

// // returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }