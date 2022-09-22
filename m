Return-Path: <ksummit+bounces-777-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555D5E6493
	for <lists@lfdr.de>; Thu, 22 Sep 2022 16:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E5F01C20AB4
	for <lists@lfdr.de>; Thu, 22 Sep 2022 14:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8253C39;
	Thu, 22 Sep 2022 14:01:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2F3C26
	for <ksummit@lists.linux.dev>; Thu, 22 Sep 2022 14:01:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 98106735;
	Thu, 22 Sep 2022 14:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 98106735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1663855280; bh=0X2VOXS7AEoKvoeXcivKYDt8IliGdOXuZc3Dgz7NRxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tfnhrpq7aQEk0fJVAAYA0fcLSmyMAls1dfW2SZnTfvCiqHzEx71kZfbMsO+mJt8mU
	 f39plQiLRWGBv6G+LwizVj5RPzhXGRqZSE9omqlfVtcjywwSS2DSoatPj/aG/kPkhW
	 FKEPcdnVSY3DC1Fjr5HqLRWSgO0pQq0DfR0/dA/wNLwfqKkHkljAv/vxhUdfmUlDzk
	 gLfSiXZLyo8KV5yHG+oHaT25ZbtmcbOptuVxFqSndSkifBEKYT3tWkIS7l3PzFi2bk
	 XXX4Y1OS/bPK5tsN746jBzKpuqfvXJ2fsutbXbm1CQScNd9fJbCTKpH/FWzi1nUnMu
	 naVDHKAyfus7g==
From: Jonathan Corbet <corbet@lwn.net>
To: Vlastimil Babka <vbabka@suse.cz>, Chris Mason <clm@fb.com>,
 linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tech-board@lists.linuxfoundation.org,
 tab-elections@lists.linuxfoundation.org
Subject: Re: [Tab-elections] Results from the 2022 LF TAB election
In-Reply-To: <70136115-5e77-c00a-9c29-b06cb8fcef0d@suse.cz>
References: <87h71984jy.fsf@meer.lwn.net>
 <9755284e-6b57-8340-dbf5-1bb50f036da3@fb.com>
 <70136115-5e77-c00a-9c29-b06cb8fcef0d@suse.cz>
Date: Thu, 22 Sep 2022 08:01:19 -0600
Message-ID: <87leqbse34.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Vlastimil Babka <vbabka@suse.cz> writes:

> I was wondering, as the voting is fully online now, does it have to
> still overlap LPC exactly? For example I happened to miss the most
> important e-mail from CIVS in my inbox during the conference, and while
> I tried to login there by the activation code, I could only see there I
> was invited to 2021 poll but didn't see the 2022 one (nor I can see it
> there now; I assume the link from the CIVS mail would have worked, but
> too late now).
>
> Also, since it seems many of the nominations were last-minute [1] I only
> saw two of them by Friday. So even if I didn't miss the CIVS e-mail, I
> would have to read through the manifestos and rank the candidates
> quickly during LPC, which wouldn't have been ideal.
>
> So maybe the vote could be scheduler for the week before LPC? And then
> both the new and old TAB members that happen to travel there could meet
> there knowing the results already.

The current charter for the TAB ties the voting to the kernel summit; in
the move online we interpreted that as running during LPC, where what
remains of the kernel summit is held.

I don't think it has to be that way; it might be better to pick a time
of the year when things are relatively calm and just always do the
election then.  It would require a charter change, but that should be
doable.

Thanks,

jon

