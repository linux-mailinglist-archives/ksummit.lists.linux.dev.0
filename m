Return-Path: <ksummit+bounces-2666-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03897CB25E0
	for <lists@lfdr.de>; Wed, 10 Dec 2025 09:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2BF30194DA
	for <lists@lfdr.de>; Wed, 10 Dec 2025 08:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70762FFDF5;
	Wed, 10 Dec 2025 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTkVkN35"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170892E7BC2
	for <ksummit@lists.linux.dev>; Wed, 10 Dec 2025 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354318; cv=none; b=gSHNpAfdyTOHbIfI3EnWg7RsPRfNL2NqGiPzuB51dyhrUEZEjLuLxlNalCsJnq2tgz1YOtJhhmzmtmgyjvUFBLfUaQG1vD9kEmITVBUoFwdfnovQz/CABYBtaF4tKVFaSJznh2krfCSZ1hZEr2Bzev97ovdCmzjqxHx2yxKnWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354318; c=relaxed/simple;
	bh=QRuJ4pN+LZwhPXJV+ToRPwfiWbwV/DT9xrXsnuOh4LY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mf6yD53Tsz2aexk9RU7rlCXZmCE3W0UIWph2d+tpTb0hapNqfbj+5Dh0aTEojFKWV9zd6+C9F6VghnN0O3TKuNQTyxRbreYsf+mHkQlSf6mKBTWo5ODdjBe5gxTXo1CLD8GicaeiluVOeRsiD4pXZkDfnlZiWGMR7Po7fpsj+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTkVkN35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E98C4CEF1;
	Wed, 10 Dec 2025 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765354317;
	bh=QRuJ4pN+LZwhPXJV+ToRPwfiWbwV/DT9xrXsnuOh4LY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VTkVkN35gKxkIyBOi01VWvAV4q7YbsBs/bAJKpy6htPuJTzDdBMANPn3KSd+RJ44X
	 OnxNYKWLUtXHfGhtA6XjThOK2Rk6zzyFSlltfdqTP0ganouuMzxJiTTQJUyHo84x4U
	 EyrlTiaJq5dJuXC7Ke7/mM8trMuhwloip2oT5fT0WNrvH858f/MtsMCGPhRtpuBPZl
	 1AU61b9iVwEf428zFqopIK3yuyoXH1g4mTr0wOr3TdSAV8WcM9xNLsvgZ69dGjRSFa
	 p7TPrgjxB1995BwjU+3JQ1+g4jdcN6ujvtuk+FhGYGL5JiuI4o04Vqh0IFymQ/1/dQ
	 TDgNFPjjxXhrQ==
Date: Wed, 10 Dec 2025 09:11:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
Subject: Re: kernel.org tooling update
Message-ID: <20251210091153.014a5618@foz.lan>
In-Reply-To: <20251209-roaring-hidden-alligator-068eea@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Em Tue, 9 Dec 2025 23:48:24 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> I spent a lot of time on trying to integrate AI into b4 workflows, but with
> little to show for it in the end due to lackluster results.
> 
> - Used local ollama as opposed to proprietary services, with the goal to avoid
>   introducing hard dependencies on third-party commercial tooling. This is
>   probably the main reason why my results were not so exciting as what others
>   see with much more powerful models.
> 
> - Focused on thread/series summarization features as opposed to code analysis:
> 
>     - Summarize follow-ups (trailers, acks/nacks received), though this is
>       already fairly well-handed with non-AI tooling.
> 
>     - Gauge "temperature" of the discussion to highlight controversial series.
> 
>     - Gauge quality of the submission; help decide "is this series worth
>       looking at" before maintainers spend their effort looking at it, using
>       maintainer-tailored prompts. This may be better done via CI/patchwork
>       integration, than with b4.
> 
>     - Use LLM to prepare a merge commit message using the cover letter and
>       summarizing the patches.
> 
> I did not end up releasing any features based on that work, because:
> 
>     - LLM was not fantastic at following discussions and keeping a clear
>       picture of who said what, which is kind of crucial for maintainer
>       decision making.
> 
>     - Very large series and huge threads run out fo context window, which
>       causes the LLM to get even worse at "who said what" (and it's
>       already not that great at it).
> 
>     - Thread analysis requires lots of VRAM and a modern graphics card, and is
>       still fairly slow there (I used a fairly powerful GeForce RTX).
> 
>     - Actual code review is best if it happens post-apply in a temporary
>       workdir or a temporary branch, so the agent can see the change in the
>       context of the git tree and the entire codebase, not just the context
>       lines of the patch itself.
> 
> I did have much better success when I worked to represent a thread not as
> multiple messages, but as a single document with all interleaved follow-up
> conversations collated together. However, this was done manually --
> representing emails from arbitrary threads as such collated documents is a
> separate challenge.

I would love to see what you got there. I tried to an experiment similar
to it, also with ollama, writing some code Python code from scratch, aiming
to run locally on my GPU (with has only 16GB VRAM but it is a brand new
RDNA4 GPU), using a prompt similar to this:

            You are an expert at summarizing email threads and discussion forums. 
	    Your task is to analyze the following text, which is a chunk of an
	    email thread with nested replies, and provide a concise, structured summary.

            **Instructions:**
            1.  **Reconstruct the Chronology:** Carefully analyze the indentation levels (e.g., `>>>`, `>`, `>>`) 
		and timestamps to determine the correct order of messages. The oldest message is likely the most indented.
            2.  **Identify Speakers:** For each message, extract the first name from the "From:" field (e.g., "From: John Doe" becomes "John").
            3.  **Consolidate by Topic and Speaker:** Group the main discussion points by topic. 
		For each topic, summarize what each person contributed, consolidating their points 
		even if they appear in multiple messages.
            4.  **Focus on New Information:** Ignore salutations (e.g., "Hi Mike,") and email
		signature blocks. Focus on the substantive content of each message.
            5.  **Output Format:** Provide the summary in the following structure:
                -   **Main Topic(s) of Discussion:** [List 1-3 main topics]
                -   **Summary by Participant:**
                    -   **[First Name 1]:** [Concise summary of their stance, questions,
			or information provided, in chronological order if important.]
                    -   **[First Name 2]:** [Concise summary of their stance, questions,
			or information provided.]
                -   **Outcome/Next Steps:** [Note any conclusions, decisions, or action items agreed upon.]

            **Text to Summarize:**
            {chunk}

Yet, grouping e-mails per thread is a challenge, specially since
I was planning to ask it to summarize it in short time intervals,
so, picking only the newer emails, and re-using already parsed data.

My goal is not to handle patches, as I doubt this would give anything
relevant. Instead, I wanted to keep in track with LKML and other high
traffic mailing lists to pick most relevant threads.

Btw, I got some success summarizing patch series from a given Kernel author
along an entire month using just the e-mail subject, with mistral-small3.2
LLM model, and a somewhat complex prompt. Goal was to summarize how many
patches were submitted, grouping them by threads and different open source
projects. Output were far a way from being perfect, and, if the number of
patches is too big, it starts forgetting about the context - with is one of
the current challenges with current LLM technology - even on proprietary
models.

It sounds to me that, with the current technology, the best approach
would be to ask AI to summarize each e-mail individually, then group 
the results using a non-AI approach (or mixing AI with normal programming).

> Using proprietary models and remote services will probably show better
> results, but I did not have the funds or the inkling to do it (plus see the
> concern for third-party commercial tooling). I may need to collaborate more
> closely with the maintainers already doing it on their own instead of
> continuing my separate work on it.

Yeah, the best is to have this not dependent on proprietary
models or on external GPU farms. I wonder if a DSX Spark would be
reasonably good with its 128GB unified RAM for something like that.
Its price is still too high, but maybe we'll end having similar
models next year to allow local tests with bigger models.

Thanks,
Mauro

