Return-Path: <ksummit+bounces-246-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B684C3BD951
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E216D1C0EBF
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5056A2FAD;
	Tue,  6 Jul 2021 15:02:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7725E168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:02:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E82BA61A3E;
	Tue,  6 Jul 2021 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625583720;
	bh=SYrJDBP6jMDAg3PVz2HnnnIVvlEgKP6386E2LiER5WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2DvVOhKQE4z82UWiPXCofw+NQeTuqI237W23kZIQasFiNecxxmfo2p+ME/lXAVwn
	 kuPdKmlISCNsAB7GyZzgoFlpdtlypxdJnd3AOkCcGsJjSWfX8SRfVxURsUfOnNqKnH
	 FUhIETYyMLABZ19tLKvmwpe4g/u1jcIY5/8peLEJsjMiVeDzIHgxrrvxE3dnKfTrt9
	 VgC3RNQ835JIxN4lrugVnUQY+yYb9HxajCCwXfiyqgF4Fw/iHK8RJ/WPHB5xHgN/6S
	 v7nKIQelPfbyehyoI7Ad5dgDKh0EtDJqZAPiXmvKnRt1HPSe8vV4bOuhnTAknRS9Jl
	 v82ur5ooTEI4g==
Date: Tue, 6 Jul 2021 11:01:58 -0400
From: Sasha Levin <sashal@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YORwZhbly1T9OIKw@sashalap>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
 <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com>

On Tue, Jul 06, 2021 at 04:55:56PM +0200, Miguel Ojeda wrote:
>On Tue, Jul 6, 2021 at 12:20 PM James Bottomley
>> 3. Less review: The lack of kernel programmers understanding rust
>> hampers reviewing.  Since most of our CVE type problems are usually
>> programming mistakes nowadays, the lack of review could contribute to
>> an increase in programming fault type bugs which aren't forbidden by
>> the safer memory model.
>
>Yes, this is a fair point. Initially, our plan is to work with
>subsystem maintainers that do want to start providing a Rust API for
>their subsystem. Then they can maintain drivers using such API.
>
>We definitely do not want to have drivers written for a particular
>subsystem if nobody is able to review (or even write) the Rust
>abstractions for that particular subsystem.

How do you see this working on the -stable side of things? It's hard
enough to get review for C code, the amount of people who would do a
second review in the context of a -stable release would be non-existant.

-- 
Thanks,
Sasha

