Return-Path: <ksummit+bounces-2239-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF0B3CB4F
	for <lists@lfdr.de>; Sat, 30 Aug 2025 15:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C44C1BA5094
	for <lists@lfdr.de>; Sat, 30 Aug 2025 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C32228C99;
	Sat, 30 Aug 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DndYw8Yz"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD61A9FBC
	for <ksummit@lists.linux.dev>; Sat, 30 Aug 2025 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756561049; cv=none; b=MJytAd8fQioLnyEe+/N9ezzqc92pJQStIbrGHnDWKAlH/2xSia7PxekTvkM7HvfAyzbx3OnSCDYlj33zIZefm1etng9JYudsv9YQ/uycqOsyqWC1pN7g0r4Xyb2vn3RNfN3Qo0/FghK47MJ+Fcm50n1KP2cl0qUisdmyjSZNhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756561049; c=relaxed/simple;
	bh=PRXulmq2MtQqsnynsoMoHtq1jvPwQiiPV0YK53vCb4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hfQyoSOpL5OjxnXQSjkM/QUxDJUM3xw04C666z+6x8I3OzeOxCxVN+LghikeH18xkJR8mbn3k12Jva3z9pacjXvx7IGty34AWHi6pBPFqp2det7rug7GiXcMl/DGjaBv4SgKRQlw3hVOeJdWNc1eBNo+HjJ6j2brC57K98i7/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DndYw8Yz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AE75D40ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756561046; bh=H+95uQuLC9ps6TNKQFuDylLFDazJ1j4v+jOr6xX6ki0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DndYw8YzMskoERUIDxY895nS28f0ifEsY12K3HzT0EOPDQY8FpTGbnemE8lLWWExj
	 4/1Y4NxrgzPAT994QyRPlrnGMiq+qTcZInKmVs/76/ubOzpMpTY4re6bPFC73k9b8M
	 ieRt0pt2/rFS6CrIccWGFAMQ3++qf3lpf4JISm3JSucI5DGabPLryEOeXEjJkFJ6Pv
	 cZbY7SgbE1OgN8LH47U3joJGURanPiH7Y6Q3MozhqbDk6FNByl9XtQeACtTWQPPoNF
	 tPlgLTIApak92iV9onkTRLynM/CVzNEYXS1Y2jiPuuf5lhbgWDsjrKXGqb/jqrv5Ue
	 rajKG80M+SGdA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AE75D40ADA;
	Sat, 30 Aug 2025 13:37:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250828230104.GB26612@pendragon.ideasonboard.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
Date: Sat, 30 Aug 2025 07:37:25 -0600
Message-ID: <87wm6l0w2y.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hi Jon,
>
> On Fri, Aug 22, 2025 at 04:55:51PM -0600, Jonathan Corbet wrote:
>> The last year has seen a massive amount of work in our documentation
>> build infrastructure and continuous improvement in the docs themselves.
>> This session will provide a brief update of what has happened recently,
>> followed by discussion on what we want to do next.  How would we like
>> our documentation to evolve in the next year or three?
>
> One area that I think could be improved is making documentation more
> accessible, in particular to newcomers. We have a really impressive (and
> ever increasing) amount of documentation that has mostly grown in an
> organic fashion. As a consequence, many answers can be found when one
> knows what they're searching for, but reading documentation is painful
> for newcomers. It doesn't flow naturally, and lots of concepts are used
> before being introduced much later (or in entirely different locations).

Trust me, I get it.  That's why I have pushed so hard to try to organize
the docs with the intended reader in mind.  I think that has worked out
well but, so far, the main effect has been to take a massive unorganized
pile of stuff and arrange it into several pile of stuff, hopefully with
slightly better organization.

Occasionally I make an attempt to attack one of the top-level books and
create a bit more order there.  But my teaspoon is going to take a while
to drain that ocean.

> While some documents are clearly meant to be reference material, other
> target developers who are not familiar with the topic being described.
> They would benefit from being written in linear, story-telling way. I
> don't know how to best achieve that though: developers writing any kind
> of documentation in the first place is already an achievement, and
> writing the documentation while putting yourself in the shoes of someone
> not familiar with the topic is not an easy task.

It is common to divide technical documentation into four broad
categories: tutorials (for learning), howtos (getting tasks done),
explanation (understanding what's going on), and reference.  Each is
aimed at a different audience.

Most of what we have is reference.  There's an occasional howto, and
some explanation in spots.  We don't have much in the way of tutorials.

It would be nice to (1) recognize those categories in the organization
of our documentation, and (2) fill them out somewhat.  But, as you note,
getting people to do that is hard.  Doing it properly requires somebody
whose job is to create that sort of material...and, as I've harped on
for years:

	Despite the fact that there are large number of people paid to
	work on the kernel, there is not a single person whose job is to
	work on kernel documentation.

Last year we tried an experiment with a bit of funding from the LF to
create a bit of paid documentation; for a number of reasons, that
experiment did not work out.  But it seems there should be a way to make
some forward progress on this front.

Thanks,

jon

