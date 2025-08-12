Return-Path: <ksummit+bounces-2137-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98379B22BAE
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F572A8179
	for <lists@lfdr.de>; Tue, 12 Aug 2025 15:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7F72F547D;
	Tue, 12 Aug 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Slj6NI57"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DAC2E2F1B
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012484; cv=none; b=JODKnYBMZnTTo1dcIU/lhmEUsjbZ6rHL3XgcMpuW4sIJaLjml9FjwbnhlV+zJm4U0SF2dkohDYoaiZTKQyxh/A78ugRGh//H+khNFe6XCBfmMYy5Lu7zlk7h+bLpYrnPz14y9ujQZwSDdsXocLXvk4L7IS9YIM8EGplK5dR8SiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012484; c=relaxed/simple;
	bh=bwweifuRwPP6zZ+btXLbS898SRE61CJJUKHBDsu2omc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNNzUsdF3haMvFIuQCTspWLwqJtOzdisTd2EJikfzB9grBcpbw0CgtTguqV3XtCLLkpJzcgth4dAPXIkubA/RqVpLT44rSuC1QcR4QtV1EZ1zDr2OQhAEQWG1lIIG+jhWUKt2ZPM1izu2rjyigCNyEvF8E09VbX9VreL217uitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Slj6NI57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BA7C4CEF0;
	Tue, 12 Aug 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755012483;
	bh=bwweifuRwPP6zZ+btXLbS898SRE61CJJUKHBDsu2omc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Slj6NI57b6z4nHgOmDMqFnDiGOhCSKCmk9HHHlUyYqSQ+QM3XBCyYHV31eErgvP8v
	 u75FYRgO6xuv15XjsG4X7W/YKZLxRKQgj4SKgkTVb5hzTfQuf46a6dkDwMQE2NT8fY
	 zMCiv2cNWLfOxRFvxaewnhVH2E3gCTA+hzuEHjfhnwA+LiY5iVOU4uV/cop5SPMH0z
	 lk1kJC0AZbsa4JWnhddJSTRYMdchbgQekrRyUXbkK6utWO5NHHQQ/iXES4amnhReVp
	 ZWeijPOVEUhUlH7lt3GiZe2FPAc7yeoPf0t9wI95pQw40OXvl3nqBwO8wqGJZE+3i4
	 UsJETnBC5kZZQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1BDF5CE0AB1; Tue, 12 Aug 2025 08:28:03 -0700 (PDT)
Date: Tue, 12 Aug 2025 08:28:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	"H. Peter Anvin" <hpa@zytor.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <49f1a974-e1e6-4be5-864e-5e0f905e1a8f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
 <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
 <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
 <20250812103710.5faf83fc@gandalf.local.home>
 <aJtXmi6IFaH4ST_s@lappy>
 <3023b60f-69cf-4d77-b57e-c294d646daa7@paulmck-laptop>
 <aJtc_TVG5F-5Ptfe@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJtc_TVG5F-5Ptfe@lappy>

On Tue, Aug 12, 2025 at 11:25:49AM -0400, Sasha Levin wrote:
> On Tue, Aug 12, 2025 at 08:24:11AM -0700, Paul E. McKenney wrote:
> > On Tue, Aug 12, 2025 at 11:02:50AM -0400, Sasha Levin wrote:
> > > On Tue, Aug 12, 2025 at 10:37:10AM -0400, Steven Rostedt wrote:
> > > > One thing I look forward to with AI is that it will likely help me debug my
> > > > own code. I suspect it would be really good at reading my code and say
> > > > "Hey Stupid! You forgot to free this value over here". And things like that.
> > > > In other words, I trust AI to debug my code more than I can debug its code.
> > > 
> > > I'm surprised that this isn't too common of a practice at this point.
> > > Sure, AI will make mistakes, but I think that:
> > > 
> > > 1. It's much better at reviewing rather than writing.
> > > 2. Mistakes aren't critical (you'd review it yourself anyway).
> > > 3. No legal issues.
> > 
> > Ahem.  Please do us all a favor, yourself included, and go count the
> > number of lawsuits currently in flight on this topic.
> 
> For using AI for review, where it doesn't generate any code? I'd love a
> reference please :)

Code is not the only thing that is subject to copyright.  But please don't
take my word for it, go ask Napster.

							Thanx, Paul

