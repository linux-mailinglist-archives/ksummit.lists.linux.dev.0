Return-Path: <ksummit+bounces-2549-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C486BE3502
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD7CA345ADB
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A72631D72B;
	Thu, 16 Oct 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/RKjk8Q"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4E2E03E6
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617140; cv=none; b=Di63vLTa73k4i61MnysQ42BkJAadB2xhpkBAIwaAknw58lYDpHvwoiDe6fNir0ai74nI2t6g0X4XW3NDjq+esv6fiYT92y5RVQToZKeiV3Grrqvd99FzVZ9MmQyM+Qvv4Ac9E4XabgDXdrT6+BirFEOBMOWj+lWRbj2AfZvwJok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617140; c=relaxed/simple;
	bh=oBhPN5cwsbedxtoHeA6FY47vyOlwE/+bzT+GqOnHHUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ne9uoJSMmYq8E/nl4cWAsyOBRzOAbokP7tnn6pHEALrXEaUZmIbC4eJPoqFEtVnt+Wk02bvpyJFSV0f7dCQ6k6Z3Aj9xdTTaVd5vuLxSnA/AXb8Rn98l4J26oe12kOdiVf6bknuu14gQtm4owGnOjCGzF9XNSs+qcTCQHcsj4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/RKjk8Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2767CC4CEF1;
	Thu, 16 Oct 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760617140;
	bh=oBhPN5cwsbedxtoHeA6FY47vyOlwE/+bzT+GqOnHHUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/RKjk8QxHHu651C4WWk1kPuxM2mtpZNtCkkS0GB1q2OunG2sBf7yTf4dRTxjJ8Qo
	 2icYrghiVcj4SUDyeJhaVRhJ44q5U+044QKWZ9o/OZeCLB76pcorzGk7Hf7OSrTHWG
	 9r4veH9i5TweGxiftR09dHJVNKu5r4/kQ3xQEecm5YtE9UcYjG05ryaDE/cDsRuBwp
	 Rrf2gJXt78R9hNLv5/7FXtEvTKWoQeAuIUeS7dABcnrWjhqYRd4h77OAwrMxzJWJBK
	 UUYu7ztWedkZlfns2TZ/ychUPrqG/YYbmICPOr92n2VP5pQaudOJ45gBFnISJiJC+l
	 RjydnZL3mTnZg==
Message-ID: <f54e4750-ac02-4ba4-a485-b0926a11acd5@kernel.org>
Date: Thu, 16 Oct 2025 14:18:57 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
 <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
 <20251014153521.693907a1@gandalf.local.home>
 <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
 <20251015182245.05c28887@gandalf.local.home>
 <CAKMK7uG7DjduHj7hjFi2sk11UqbFcZHuXBF_+Ea7SKbV15e00Q@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAKMK7uG7DjduHj7hjFi2sk11UqbFcZHuXBF_+Ea7SKbV15e00Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Oct-25 12:16 PM, Simona Vetter wrote:
> On Thu, 16 Oct 2025 at 00:22, Steven Rostedt <rostedt@goodmis.org> wrote:
>> On Thu, 16 Oct 2025 00:01:38 +0200
>> Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> So yeah, circling back to "benevolent" -- for me, this has definitely
>>> broken the "benevolent" part and a lot of trust. But that's fine, I can
>>> also do a job that heavily resolves around following a manager's
>>> arbitrary whims. But my heart won't be in it.
>>
>> Yes it does appear that we all have extra work to do because one person
>> doesn't like the current method. I don't think I saw anyone else complain
>> about the "useless" link either. Maybe I missed it. But currently it's all
>> been "Alright, fine, I'll work around this" and not one "Oh Great! This is
>> most definitely helpful!", like what happened when Linus created "git".
>>
>> I'm currently looking for someone to help me with my maintainership. Masami
>> came on board, but what happened was that he basically maintains all things
>> "probe" related and I do everything else. That split still takes up more
>> time than we have designated.
>>
>> Unfortunately, I've had many people say to me "I don't ever want to be a
>> top level maintainer" and "better you than me", which makes it very
>> difficult to find a helper. This discussion isn't helping with that
>> perspective either.
> 
> +1 on both Steve's observation and Johannes' entire mail.

+1 from me on both too.

Or as Geert put it: "So, can we please get our Link:-tags back, and get back
to real work (or vacation ;-)?"

Regards,

Hans



