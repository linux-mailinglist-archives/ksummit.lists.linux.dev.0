Return-Path: <ksummit+bounces-2136-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C179BB22BA7
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D10977B37A4
	for <lists@lfdr.de>; Tue, 12 Aug 2025 15:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8922F547C;
	Tue, 12 Aug 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2uIDWoW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C4F2F532B
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012353; cv=none; b=FYZqdgCtLxSsj34pQI0sLVSTO7owca7MjkeIqRmpZcNoGkcDC0G97MeN2kC1K+prE96YM/Yi6gpZQ95GX32U0aUD1rdX4xAQxlzfKvI15kvElV//nvdC3qxmrul7uWIR82zFnsPTnpxnQP6eagOTbYp3wy1sASE3Ca5Oya9txfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012353; c=relaxed/simple;
	bh=sOtrJat7X2RP2j17C2bDTBiVcbRUpCWcy0t1QX4s/K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCfpnRAgg/d5o7+wOOu5TS/hv+jiA4o/SXMO0SgpD7N3n+doJCtxjuhnrJgNYCUHfnnsbd3M6ufHDv0Ur+x8EYHSPBSY3r0qz7S9Wtfw1AaCJI/CdBkhNH8TwHTsU1EhUvAHhOz8zMFSNLV5YwKdBfmoSt+GlsGeYRemp/JXH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2uIDWoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B56CC4CEF0;
	Tue, 12 Aug 2025 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755012352;
	bh=sOtrJat7X2RP2j17C2bDTBiVcbRUpCWcy0t1QX4s/K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2uIDWoWJ93qVX66GKTSVW38Ux/tIJStg2lwMpgZTIjA4qPc5S/0YQJ3pDzzSK4W6
	 kQ/ByQfxJBdbhh3fC1FsePiKAVubN5vUWEH37IDXt8ujHfdYGc0fC4GzQamH/MFPT4
	 greD/aPg5yGIU4geNA6aDrvzs3wlA+vSYJIE1F4JFVXOGwtax4oRLakuxjegO5RSfM
	 hdR+K/QqW6BTyRF8BY6ncngGuppZolI4u+k6I9TKfG4zxbROS2l2IoSPZtALTiPDqm
	 UR/7aKEDJ7iNF6zHVkWy6moI0yvL8AApCgjFoDOAla1eR5z6THGcYX0CfQEqu1SzR3
	 w/91bVE4C1JQw==
Date: Tue, 12 Aug 2025 11:25:49 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	"H. Peter Anvin" <hpa@zytor.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJtc_TVG5F-5Ptfe@lappy>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
 <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
 <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
 <20250812103710.5faf83fc@gandalf.local.home>
 <aJtXmi6IFaH4ST_s@lappy>
 <3023b60f-69cf-4d77-b57e-c294d646daa7@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3023b60f-69cf-4d77-b57e-c294d646daa7@paulmck-laptop>

On Tue, Aug 12, 2025 at 08:24:11AM -0700, Paul E. McKenney wrote:
>On Tue, Aug 12, 2025 at 11:02:50AM -0400, Sasha Levin wrote:
>> On Tue, Aug 12, 2025 at 10:37:10AM -0400, Steven Rostedt wrote:
>> > One thing I look forward to with AI is that it will likely help me debug my
>> > own code. I suspect it would be really good at reading my code and say
>> > "Hey Stupid! You forgot to free this value over here". And things like that.
>> > In other words, I trust AI to debug my code more than I can debug its code.
>>
>> I'm surprised that this isn't too common of a practice at this point.
>> Sure, AI will make mistakes, but I think that:
>>
>> 1. It's much better at reviewing rather than writing.
>> 2. Mistakes aren't critical (you'd review it yourself anyway).
>> 3. No legal issues.
>
>Ahem.  Please do us all a favor, yourself included, and go count the
>number of lawsuits currently in flight on this topic.

For using AI for review, where it doesn't generate any code? I'd love a
reference please :)

-- 
Thanks,
Sasha

