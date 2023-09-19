Return-Path: <ksummit+bounces-1168-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9E7A6CEB
	for <lists@lfdr.de>; Tue, 19 Sep 2023 23:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE931C209DB
	for <lists@lfdr.de>; Tue, 19 Sep 2023 21:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A22374C3;
	Tue, 19 Sep 2023 21:26:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274E347C7
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 21:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B903DC433C8;
	Tue, 19 Sep 2023 21:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695158815;
	bh=hO0VfGhbZnHNPMln55LGJFynN3MnNlCWedu4rKGORMU=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=qDCH+9kIrlFGXGofHrivv9CILlEl5e5IAs5ZRlCR1D1MXGF0tNYQVrA/c655jOs3b
	 wmgTus6uwquKXoiJoeUB/B3pHMPEjdcjb9C3gWUtuFyFr/viRxpPJXlfqFufL1IzH6
	 l6igjxMtDFY+V54PQXuoIHwHZ1ez8q/1bF4SwPBYqeHUfd4CmlznLI5gGGAUy81O8q
	 zrL1tYOwWE64UDWqsE4THuxEXpufbUt9M2HWw57b+6mWpAUb9bZZzoOg0Hj+Ty0i4v
	 4xM/KNjg8MaOPC/YQC3jLDn8aq4U5094pHHFo1Tl5mSm2/GFXIFm80T1wtCL4DED/o
	 Um39Y1hU1AkUQ==
Message-ID: <049fb4c9-825a-e856-2e90-92b81baa1fe8@kernel.org>
Date: Tue, 19 Sep 2023 15:26:55 -0600
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
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
 tech-board-discuss@lists.linux-foundation.org
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
 <f5b4f69056a5ec104fc58e55137912495caf11d4.camel@HansenPartnership.com>
Cc: shuah <shuah@kernel.org>
From: Shuah <shuah@kernel.org>
In-Reply-To: <f5b4f69056a5ec104fc58e55137912495caf11d4.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 11:54, James Bottomley wrote:
> On Tue, 2023-09-19 at 10:52 -0600, Shuah wrote:
>> Hi Steve,
>>
>> On 9/19/23 10:10, Steven Rostedt wrote:
>>> There has been several topics brought up already about maintainer
>>> burnout.  A while back, I was talking with another maintainer that
>>> basically told me that they were ready to quit being a maintainer
>>> because it's not fun anymore. There's a lot of requirements and
>>> basically have to deal with crap from submitters. The Code of
>>> Conduct has been successful in helping to keep a more civil
>>> environment, but all the focus has mainly been around telling
>>> maintainers how to behave.
>>
>> As a member of the CoC, I respectfully disagree with the statement
>> "but all the focus has mainly been around telling maintainers how to
>> behave." This impression might have been the result of one
>> unfortunate incident that took place last year. is only part of what
>> CoC has been doing.
> 
> If it helps, I proposed a more generic version of a maintainer stress
> session here:
> 
> https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
> 
> It doesn't mention the code of conduct at all.  I really think
> focussing on stress coping rather than pointing fingers at the alleged
> stress inducers would be the way to move forwards on this.  Although it
> might be helpful to have a non judgmental listening session about what
> everyone thinks the major stress inducers are.
> 

Thank you for the link. I think your proposal addresses various stress
factors for maintainers and developers alike. I am referring to wearing
two hats problem of balancing corporate strategy and development needs.

Maybe it is time we collapsed all the proposals related to maintainer
stress and addressed then instead of piecemeal discussions.

thanks,
-- Shuah

