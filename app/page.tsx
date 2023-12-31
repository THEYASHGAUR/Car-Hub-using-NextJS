import { CustomFilter, Hero, SearchBar } from '@/components'
import Image from 'next/image'

export default function Home() {
  return (
    <main className="black overflow-hidden">
      <Hero />
      <div className='mt-12 px-4 py-4 w-max' id='discover'>
        <div className="home__text-container">
          <h1 className='text-4xl font-extrabold'>Car Catalogue</h1>
          <p>Explore the cars you might like</p>
        </div>
      </div>

      <div className="home__filters h-96">
        <SearchBar />

        <div className="home__filter-container">
          {/* <CustomFilter title="fuel" /> */}
          {/* <CustomFilter title="year" /> */}
        </div>
      </div>
    </main>
  )
}
