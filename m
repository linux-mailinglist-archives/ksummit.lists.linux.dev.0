Return-Path: <ksummit+bounces-2158-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CFB2B353
	for <lists@lfdr.de>; Mon, 18 Aug 2025 23:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2BC1BA443A
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DDD263F5F;
	Mon, 18 Aug 2025 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYIP/ns6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09925BEF1
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755552217; cv=none; b=jTPKVSYNeyZFwByVwbnEsop1WLUK+k7NmwzV20w2wigAai037u9DQBa/BixM0hHI2WrJObKOOmfMHQqM+g/lWXfJ/Xxd3LY/4Ob6a0OQOfbHx5rsAcU3KcKq21yj9Nz6vEy8It0Xbb4KsCzSdXuBaLj8GEWKM4QKSvs5c22Waz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755552217; c=relaxed/simple;
	bh=XQT0EVSSDw8ESTCXDAryrbmlqpxNoEe/LJWKWzdRwGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7SDMCjvmW6NTnDgqBS9hmSJ9WjuX5EuEvj1eajTlGEXNmrJ73H3oLsh4PZ+y7xPwvgpSu1I2JMxVrFPcCPnkF1Y31B/gpG84YA1jLS00Ge3Sg+XuJ1jLNk/fzYnbK6xOn2NfEkj4gjFW4v7dx51Xmlp5qYkKPs9qgxV50x7aSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYIP/ns6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FA2C4CEEB;
	Mon, 18 Aug 2025 21:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755552217;
	bh=XQT0EVSSDw8ESTCXDAryrbmlqpxNoEe/LJWKWzdRwGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iYIP/ns6hPaSiEV24l6J2RU619zrOeDJODIFAnwaKXC9IUcrXNFzfGXmaV/4VkiJV
	 zjeH1PSiszYfKOa/UVkcnBeTpwcsOFZV5wfNUBxBh30bHdb6aqFNS71k/UJtZzNO+5
	 zk6R5nXzw7AjpgLwIHWlhHdlLgrq3AyEg2S2VqEZ0EOG7mNw68Ybg19ZeZaoh2qnFg
	 E1dIPCbb2rAMbH80o9q3T40bIaBwxmo6RPjfLoblAFgs5ZS2NJfehWdOt+44lk6U1M
	 4QwECznpxaeVA3TN7d6x0Sm2p+mkUYll+NM1rVQiKRAUwCbq+rq8ZZ/aqDXqhigDq9
	 0R4iGNM6MRxOg==
Date: Mon, 18 Aug 2025 23:23:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818232332.0701fea2@foz.lan>
In-Reply-To: <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpqo48FgDLglg-p@bombadil.infradead.org>
	<a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 11 Aug 2025 15:51:48 -0700
"Paul E. McKenney" <paulmck@kernel.org> escreveu:

> On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:  
> > > depending on how that AI was
> > > trained, those using that AI's output might have some difficulty meeting
> > > the requirements of the second portion of clause (a) of Developer's
> > > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> > > the open source license indicated in the file".  
> > 
> > If the argument is that cetain LLM generated code cannot be used for code under
> > the DCO, then:
> > 
> > a) isn't this debatable? Do we want to itemize a safe list for AI models
> >    which we think are safe to adopt for AI generated code?  
> 
> For my own work, I will continue to avoid use of AI-generated artifacts
> for open-source software projects unless and until some of the more
> consequential "debates" are resolved favorably.
> 
> > b) seems kind of too late  
> 
> Why?
> 
> > c) If something like the Generated-by tag is used, and we trust it, then
> >    if we do want to side against merging AI generated code, that's perhaps our
> >    only chance at blocking that type of code. Its however not bullet proof.  
> 
> Nothing is bullet proof.  ;-)

Let's face reality: before AI generation, more than one time I
received completely identical patches from different developers
with exactly the same content. Sometimes, even the descriptions
were similar. I got one or twice the same description even.

Granted, those are bug fixes for obvious fixes (usually one liners), but
the point is: there are certain software patterns that are so common 
that there are lots of developers around the globe whose are familiar
with. This is not different from a AI: if one asks it to write a DPS code 
in some language (C, C++, Python, you name it), I bet the code will be
at least 90% similar to any other code you or anyone else would write.

The rationale is that we're all trained directly or indirectly
(including AI) with the same textbook algorithms or from someone
that used such textbooks.

I can't see AI making it any better or worse from what we already
have.

Thanks,
Mauro

