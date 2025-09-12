"use client";
import { useState } from "react";

export default function Home() {
  const [url, setUrl] = useState("");
  const [result, setResult] = useState<string | null>(null);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const res = await fetch(`${process.env.NEXT_PUBLIC_API_BASE}/links`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ original_url: url }),
    });
    const data = await res.json();
    setResult(data.url);  
  }

  const handleCopy = async () => {
    if (result) {
      await navigator.clipboard.writeText(result);
      alert("コピーしました！");
    }
  };

  return (
    <main className="p-8">
      <form onSubmit={handleSubmit} className="flex gap-2">
        <input
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          placeholder="https://example.com"
          className="border px-2 py-1 flex-1"
        />
        <button type="submit" className="bg-blue-600 text-white px-4 py-1">
          短縮
        </button>
      </form>
      {result && (
        <div className="flex items-center gap-2">
        <div className="mt-4">
          短縮URL: <a href={result}>{result}</a>
        </div>
        <button
          onClick={handleCopy}
          className="bg-gray-200 px-3 py-1 rounded hover:bg-gray-300">
          コピー
        </button>
      </div>
      )}
    </main>
  );
}