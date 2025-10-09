Return-Path: <ksummit+bounces-2460-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658ABC982A
	for <lists@lfdr.de>; Thu, 09 Oct 2025 16:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4939F3C700B
	for <lists@lfdr.de>; Thu,  9 Oct 2025 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776032E8E1F;
	Thu,  9 Oct 2025 14:30:26 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5771A9F96
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020226; cv=none; b=r45/3hajRKahEtIvVpcLDi4DEURTkaEOGUDqQ2K84as8S2UQwUzm2Dm4aWO5CSzjlTcIH718gFodfSj95n5kR7tunx91N8a6v6u72qBk1bdGMiJFtutr444xNMhM0AY+zjvncDXloYq0iWBZHDVx3SrU+N6CdNR3okKGq1LtJHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020226; c=relaxed/simple;
	bh=B3/HfuqnShiF1tKS7IF2YGfsx7ra6PMqb//sVx4sGFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQZ33jEF/7dJtnvnzLmEbSIET1POFLzUvkbVSTK+FKe5Y/0CL3krsKefVfsuR0CXcICF+WjHKr8wowvgqY7w0vlhBymUIiR4Q1o1k3mn4IRZKeMvP/2YdxizZCkXNJq9ocSf59nnsNfMYTBF8r+5AGDTrHsS8TlFTgsGH1w7Ogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id B11D65BD1A;
	Thu,  9 Oct 2025 14:30:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 7E29720030;
	Thu,  9 Oct 2025 14:30:19 +0000 (UTC)
Date: Thu, 9 Oct 2025 10:30:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Andrew Lunn <andrew@lunn.ch>,
 Chris Mason <clm@meta.com>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>, Dan Carpenter <dan.carpenter@linaro.org>, Alexei
 Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251009103019.632db002@gandalf.local.home>
In-Reply-To: <20251009091405.GD12674@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	<fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	<20251008192934.GH16422@pendragon.ideasonboard.com>
	<MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	<MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<20251009091405.GD12674@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 5k8hthxqfush6f1pg4tjy4p3z8pqzfwu
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 7E29720030
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+ngEQEFt3QolS8ZHs1TqGMQx+bGTHSgNA=
X-HE-Tag: 1760020219-683237
X-HE-Meta: U2FsdGVkX1/4Y9m8jNVGX3vCdFkXKdMARcX8ckjv017DuypVycs5nNIWVZAdqOLVkDuZpXFqWeg0RfBWJyjVzg2CsVH6/r36b4ULfJgwjRpxieJQrMa3BTpswEifxlrNbaHC6ww71aR5EDbKSVFlAXAuDK/9WHK/pWjulEkFHgO3rwCJyLbys64UDaHV3lT7JhDdIWmHOSPMzHcuzWSfMcLtAE7kBJ+40XmCcWwuDKRK5TX4oUpY1MMuNapQo+gMqToDiyyEsVNgGGK29ECKtGXFjZmKLzHyT2BJQh7JftZUR7/q7yKuuc4QnOzuK58LkHue5Mk93QFT2yJ2ep12IOTYeW9fX7hxud2BRfUtC9zTY9qADQU5hm3mT9KpBR4F

On Thu, 9 Oct 2025 12:14:05 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Forcing contributors to pay for access to proprietary tools is not
> acceptable. Forcing contributors to even run proprietary tools is not
> acceptable. If maintainers want contributions to go through any
> proprietary tooling before submission, then this has to run on the
> maintainer side (be it on a maintainer's machine, in some form of CI, or
> somewhere else).

One way I see this working is to attach it to patchwork. Sending a patch to
the BPF mailing list has their patchwork trigger a bunch of tests and it
will tell you if it passed or failed. I'm assuming if it failed, it doesn't
add it to patchwork and the maintainers will ignore it.

Attaching AI to patchwork could be useful as well. But this would run on
some server that someone will have to pay for. But it will not be the
submitter.

I've been thinking of adding tests to run when people submit to the tracing
mailing list, but I don't want to waste my electricity on it ;-) I have
solar now, so perhaps I should.

> 
> You're right that cost would then be a problem. I can certainly imagine
> $popular_ai_company sponsoring this short term, until we're
> vendor-locked and they stop sponsorship. I don't think rushing in that
> direction is a good idea.

I don't see lock in being too much of an issue, unless the server that is
going to run this adds a lot of scripts that are built on one kind of API
that is vendor lock in. If anything, you just lose the service if it
becomes too expensive and you can't find an alternative.

-- Steve

