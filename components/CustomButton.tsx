"use client";

import { CustomButtonProps } from '@/types';
import Image from 'next/image';

const CustomButton = ({title , btnType , containerStyle , handleClick } :CustomButtonProps) => {
  return (
    <div>
      <button 
        disabled={false}
        type={ btnType || "button"}
        className={`custom-btn ${containerStyle}`}
        onClick={() =>{handleClick}}
      >
        <span className={`flex-1`}>{title}</span>

      </button>
    </div>
  )
}

export default CustomButton;
