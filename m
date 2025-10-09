Return-Path: <ksummit+bounces-2457-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477CBC909C
	for <lists@lfdr.de>; Thu, 09 Oct 2025 14:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E94554F7F8F
	for <lists@lfdr.de>; Thu,  9 Oct 2025 12:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FCE2472AE;
	Thu,  9 Oct 2025 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZJmV31j"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD4F50F
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013153; cv=none; b=hiz4DGRt1xfygaFCRcapwIyyAvwbjLoevtl1hVhjyYtAZk1VOwXhs6DBHPWVXVmQRPNk/sRqouuwN9gQ6JaPWEjm1f45glNZKAs3QX+qngZ3ZLb1UUhb4ZGL+qRIctnuJ/HoBEEowL8QG9/P+WRaeqyXSANTZsOWOKzSEYE/Q8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013153; c=relaxed/simple;
	bh=6a/k2Ks7P2WeEISksnEIGtuhDUOkwgFfDRjsd0TfbYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbYF3ru9P+0pS8LvhiIZVDFNeeIQQK3XQ73QxVrkW8WVgv1f7rLWPsuWEMyzjokohbfsUUNXTP46wtAvTWSQGMX3HRG1uPtFMkAJMuGoNq9o+r3cAA1JSaUZBFXU3EDjaKzQs8Q2CPrPNDIvLLy1quy8RMkkar0CXQmY6Yqh+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZJmV31j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793AFC4CEE7;
	Thu,  9 Oct 2025 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013153;
	bh=6a/k2Ks7P2WeEISksnEIGtuhDUOkwgFfDRjsd0TfbYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZJmV31jVq9ScAHxAkLjho8tlFe4A4nux5j5CsbeK7oO1T/nQ91ZmcWh/s9XbRFHa
	 BhD16i7qbQshFZfEkGFRtKqwlQAhB1MvEzFJsC4G7alCjrcOA8K3RdUiasdLW6ajls
	 WpoCd4I+au8M3M0eS2etmzc4Tr9rCb5DBKIxWvN6OS4OAQcYpEHWcUHKNYew/1U1UK
	 tHx73F+tTs6X85K708cBiuX8blRvukuq4NtgSYSuYVTqul0JLBVV9da2b4HlLZ+ST0
	 1qH/8Wakf/AKaW21Hgfd6X53oUIlgel8NWJ1xXprpyaSCDy+9zOt2HE/DsAn0vtpeu
	 YurLoPtjOZ5mA==
Date: Thu, 9 Oct 2025 09:32:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOerXTptz7vY7OEu@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <aObJ6GPU9aKeI_CZ@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aObJ6GPU9aKeI_CZ@laps>

On Wed, Oct 08, 2025 at 04:30:32PM -0400, Sasha Levin wrote:
> On Wed, Oct 08, 2025 at 07:50:32PM +0000, Bird, Tim wrote:
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > > > My goal for KS/MS is to discuss how to enable maintainers to use review
> > > > > automation tools to lower their workload.

> > > > Maintainers will want to use these tools, if they prove to be
> > > > useful. But ideally, we want the developers to use these tools and fix
> > > > the issues before they post code for review. That reduces the
> > > > maintainers workload even more. So Maintainers just need to run the
> > > > tools to prove that the developers have run the tools and have already
> > > > fixed the problems.

> > > > So i'm not sure your goal is the correct long term goal. It should be
> > > > a tool for everybody, not just maintainers.

> > > This raises the interesting and important question of how to get patch
> > > submitters to follow a recommended workflow. We routinely get patches
> > > that produce checkpatch errors that are clearly not false positives.
> > > Rob Herring implemented a bot to run checks on device tree bindings and
> > > device tree sources because lots of patches fail those checks. I'm sure
> > > there are lots of other examples that have led maintainers to automate
> > > checks on the receiver's side, through various types of standard CIs or
> > > hand-made solutions. Submitters should run more tests, how to get them
> > > to do so is a broader question.

> > Maybe it would be worthwhile to annotate patch submissions with tags
> > indicating what tools have been run on them.  I know we're trying to avoid
> > overuse of commit tags, but maybe we could automate this a bit, and/or'
> > reuse the 'Reviewed-by:' tag in the commit message.  I could envision, in some
> > future workflow utopia, where a missing 'Reviewed-by: checkpatch.pl AND claude AI review'
> > would be grounds for requesting these before human review.
 
> This is similar to what was proposed in the last round[1] of discussions around
> disclosing (AI) tool usage.
 
> From the cover letter:
 
> 	Assisted-by: Claude-claude-3-opus-20240229 checkpatch
> 
> At which point maintainers can set their own policies for their subsystem and
> automate workflows based on those policies.

But this is just a disclosure about tools supposedly used. What about
the version, specific model, checkpatch version, etc?

Its good info, that can help understand why some parts of a patch came
into being, but shouldn't preclude the maintainer from using his best
judgement and extra tooling.

- Arnaldo

