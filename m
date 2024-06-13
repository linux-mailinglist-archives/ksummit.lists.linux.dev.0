Return-Path: <ksummit+bounces-1249-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C3990747F
	for <lists@lfdr.de>; Thu, 13 Jun 2024 16:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE14F1F228CA
	for <lists@lfdr.de>; Thu, 13 Jun 2024 14:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A9914374B;
	Thu, 13 Jun 2024 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShAcqxdG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F486C8C7
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287307; cv=none; b=vF91Ia5gNef4jC/TBoyQKWhh1ePCMshae0bQH6i8Z4/kihu6UnLcWT6mEN7BHtR62DwNasP891P3VY7E44T7JPd65VCKhyAkoQ8OVpSOsbvhv9H32b6pXXtfty4X+CF3kUwdVNzvosu9JDRDQ9pFECJDrPzrDZLZp/WfE/lzrcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287307; c=relaxed/simple;
	bh=gpI0GIgFu02Gv9R4FofmsgeaffxYjpqTMOgUl2aaCEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4ZU/G53RPN8MUaVA4Jh6to2dzDO50qK2npkc8/4Yqg9arBblcG3Dj2FL97D6dvqkGT0fdR+1mY/p7jzBHUAX/3YCSUf8PAbr1xTLbpBH4eOWY17Hp6EI9FqJ6bw6A0klVCH1U73KFZfoVy0Rqeta066NF31BlaXQyp5o68sbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShAcqxdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3623FC2BBFC;
	Thu, 13 Jun 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718287306;
	bh=gpI0GIgFu02Gv9R4FofmsgeaffxYjpqTMOgUl2aaCEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShAcqxdGOp67NeEPNaEfjgshCJdGyxh8aliT5kyaL3GyJuHxKpSLGJGLInGUSxd6U
	 W6DaaDHAW1WiAHEkRXIpHLU2vb6TQEFql8jkZ1hx28lUOEpi562MufF7ok3pwd+fK5
	 qR+Tly7NxWb8qDJJdyJD9D4bIh+6nQPSy1EZb4wQYW7A9qvRel5Zp4Yo247dItZWsj
	 WPwNOohQp3PyNveT23mz5rw2m9JIhTvzgpZdGG2h91NuTOxU5EWmJOIYAy+X0JQB+1
	 sNI7ee1Eqe5Y1plZkycGQbyDPuQUhY0qDdpozqYqv94RSRd7vcaiOCIcUdPL0WIf8B
	 LhckU/ugRHTzw==
Date: Thu, 13 Jun 2024 09:40:42 -0400
From: Sasha Levin <sashal@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <Zmr22oK1_clYwDNi@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>

On Thu, Jun 13, 2024 at 10:42:01AM +0200, Thorsten Leemhuis wrote:
>I would like to discuss how to better prevent backports of mainline
>commits to stable that turn out to cause regressions.

If you can tell us which backports cause regression we promise not to
backport them :)

But more seriously:

>* For patches that are tagged for backporting it's easy to for
>developers to influence the timing, as they can use a stable tag like
>`Cc: <stable@vger.kernel.org> # after -rc4` to delay backporting (see
>Documentation/process/stable-kernel-rules.rst for details). But for

We can delay, but in practice many of the regressions are discovered
*because* they land in stable. There is relatively little testing on -rc
releases.

I'd argue that in most cases, delaying until a later point in time will
just mean that the issue is discovered later, which isn't helpful...

[ snip ]

>* We could ask the stable team to only backport changes once they have
>been in mainline for a certain time (something like "at the earliest two
>weeks after the change was present in a mainline release or

We could, but is the net result positive? This also means that fixes for
real issues take longer to get to users.

It would make sense if most backports cause a regression. Is it the
case?

>pre-release"?). But to not delay urgent fixes we then would need
>developers to mark the urgent ones somehow. That is likely a hard sell,
>but maybe less so then what the previous point outlined; untangling
>could help here, too.

I'd argue that even developers don't necessarily know if something is
"urgent" or not. Heck, what does "urgent" mean? There are so many
usecases for the kernel that it's impossible to define what is urgent
and what is not.

>* Maybe convince the stable team to consider all commits with just a
>Fixes: tag as "non urgent", if they were merged during a merge window
>with a committer (or author?) date from before the merge window -- and
>then only backport them after -rc4 to ensure they got at least three
>weeks of mainline testing before they are backported. This is imperfect
>and has downsides, but would be relatively simple to realize.

The tricky part here is that we can't rely on stable tags for importance
determination. Individuals and subsystems simply don't add stable tags
because they don't want to, not because their commits are not important
or urgent.

>* We could extend the Fixes tag in a fashion similar to the stable tag
>(see above) to establish something like `Fixes: cafec0cacafe ("foo: bar:
>foobar baz") # after -rc4 if considered backportworthy` -- but some of
>these lines will become awfully long (they already are occasionally even
>without this add-on note).

See above :)

-- 
Thanks,
Sasha

