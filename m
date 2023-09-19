Return-Path: <ksummit+bounces-1171-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B977A6EAC
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAAC281B6E
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645E38BA1;
	Tue, 19 Sep 2023 22:32:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678693B29C
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD56C433C8;
	Tue, 19 Sep 2023 22:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695162725;
	bh=QFXl3SpZ1QteYT6kjo03x0ETIbc5oKBYGxa15omGTlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOA6XYkCUZ/QYDz8sud01pSdnkQW0q65+9GeehdW3BTIVkOYr9hdMBadHPfHgckAo
	 ptez7aZO0aI743e3g5kptEndBTUJFmkMmPhaKFnIeMnYpf2LpZeLg48ze1bMXL4Q8h
	 lA6vOzDRXYyKPFg36J6qYkjF7DjfVkwvG/WCJuIN1jZ5oXQ+JSoxK6S+/waKiWySKa
	 iKDEnYmprXHlbPIKyqTpDqmuyRyEFLyrGgdaz3C/bIL4OaGSwBNMp0nEamfPfbKEk5
	 5w3zzaKppL8M5Z8kuDY9JxkvMtr9kdhuJlLE67ezeFfj1sBoXxwYy7s6V4SgcXgsvN
	 kV4oXFJ2V6A7w==
Message-ID: <19fc6e5b-3b20-7d4c-6e50-cc3bc5cea2da@kernel.org>
Date: Tue, 19 Sep 2023 16:32:05 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Content-Language: en-US
To: Theodore Ts'o <tytso@mit.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
 tech-board-discuss@lists.linux-foundation.org, shuah <shuah@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org> <ZQoG71Vdy9iLAcY1@mit.edu>
From: Shuah <shuah@kernel.org>
In-Reply-To: <ZQoG71Vdy9iLAcY1@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 14:39, Theodore Ts'o wrote:
> On Tue, Sep 19, 2023 at 10:52:40AM -0600, Shuah wrote:
>> As a member of the CoC, I respectfully disagree with the statement "but all the
>> focus has mainly been around telling maintainers how to behave." This impression
>> might have been the result of one unfortunate incident that took place last year.
>> is only part of what CoC has been doing.
>>
>> A majority of reports are related to incorrect understanding of how the community
>> works and discusses technical issues. Most of them get resolved without involving
>> the community. This is behind the scenes silent work CoC does.
>>
>> It is unfortunate that CoC is being viewed as a body that is focused on telling
>> maintainers how to behave. I would encourage to not view CoC work based on one
>> or two cases that were outliers. CoC worked very hard to resolve them fairly and
>> that benefited the community as a whole.
> 
> Shuah, I don't think this is the fault of the CoC.  Much of it is in
> how people interpret the CoC, or think it should be adapted.  For
> example, just this past week, on the maintainer's summit, this
> statement:
> 
I agree with this statement that people have differing opinions on
the CoC role. There are people that don't think CoC is doing enough
and other side thinks it is focused on telling maintainers how to behave.
Neither is accurate.

People that think Coc isn't doing enough don't fully understand the
technical discussion dynamic and what constitutes a CoC violation,
and more importantly the role of a maintainer in making decisions
on accepting and rejecting patches.

The other side that thinks CoC is focused on "telling maintainers how
to behave" doesn't have visibility into the majority of reports CoC
determines that they fall into the category of normal technical
discussion and takes care of them behind the scenes.
  

>> Waah, waah, waah. The buffer cache is *trivial*. If you don't like the
>> buffer cache, don't use it. It's that simple.[1]
> 
> ... resulted in Linus being accused as a CoC violation.
> 
> I'm not sure that it qualifies as a CoC violation, but Dave Chinner
> certainly thought so, and publically accused Linus of that[2].
> 

> Personally, I'm not convinced that people calling people out for real
> or imagined CoC violations is always going to be productive,
> especially when it wasn't an explicit personal attack.  It's these
> sorts of edge cases is what causes some people to fear and badmouth
> CoC's.  Which is, I think, unfortunate.

Yes. I agree that going CoC over disagreements isn't productive, neither
is looking the other way when real violation occur.
  
The question we have to answer as a community is are we better off with CoC
in place or not. I would think we are better off.

thanks,
-- Shuah


