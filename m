Return-Path: <ksummit+bounces-2468-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C090BCA5BD
	for <lists@lfdr.de>; Thu, 09 Oct 2025 19:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C48F14F31E1
	for <lists@lfdr.de>; Thu,  9 Oct 2025 17:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6CB241679;
	Thu,  9 Oct 2025 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPAe3tWi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CD635
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760030399; cv=none; b=gN/NMBjXN3lXqRWIVxbD5tiOBGSX9Qi3pzcEvWez8NnrY4fS8SUiELg7yFHsvVLbUpmn5Kvt01mtznu6eFQ45Xmg8VOr/Lc2EVc9ozQdAcu8txf1I7LLfhk7z223HXRtvnyei73kYdjm0kdouVNM8KXwGL7nYyj5xYqBNfes7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760030399; c=relaxed/simple;
	bh=6rXOYCdQQFI2V+JMVzeof+nLruGOFj4Zq5CL6hr881k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoM2oEJNarfahTyFFsApxTS+qeFgK4rHP7+8tUQ11bcd0xE1f8nLOGzajEtBKeKbdA+hwhA+H20xAx2HnlwBkYZbXXRilzG4Eh0379tKOvE37n1FECaK0U61w1lEGbHm6iXhNB7beH7eZal9+GL40II3BsMtrJFmSlemHQhyb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPAe3tWi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F203AC4CEF8;
	Thu,  9 Oct 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760030398;
	bh=6rXOYCdQQFI2V+JMVzeof+nLruGOFj4Zq5CL6hr881k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPAe3tWi4H80dTGWOGM9BoqeOszncVBkH7YaW/acs4M8mqm9lc3o9JmZarVhzc0YJ
	 D4gEUzW5Dyx0kjZv9EbcitxhkfCi3SzLp59XT0NDhqAR3imQJgIVoQ1GTegPg4SXmT
	 ix66MNoC9GOA2Bi5h2HUGG6TdCld3tq0PJiYRNy/f0gKYt90Ut15dceAQUOLk+PdT0
	 RbBFTp7TheGZ5NsHmCgRMsfRxoJqgfpzPM7mSoo6WZ1Ax3FFsFxd9PpBKyOpeg6e/9
	 yx2mg7+g2sAHoCIs++RYej/pNzXZGTnS9xjZoIdGYGt2cb2UeUsfcmbYDJ8A2aJiEX
	 nofKaOGT6mVpA==
Date: Thu, 9 Oct 2025 14:19:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Chris Mason <clm@meta.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Bird, Tim" <Tim.Bird@sony.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOfuu8InYEUIZdWH@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>

On Thu, Oct 09, 2025 at 12:31:48PM -0400, Chris Mason wrote:
> On 10/9/25 10:30 AM, Steven Rostedt wrote:
> > On Thu, 9 Oct 2025 12:14:05 +0300 Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> >> Forcing contributors to pay for access to proprietary tools is not
> >> acceptable. Forcing contributors to even run proprietary tools is not
> >> acceptable. If maintainers want contributions to go through any
> >> proprietary tooling before submission, then this has to run on the
> >> maintainer side (be it on a maintainer's machine, in some form of CI, or
> >> somewhere else).
> 
> > One way I see this working is to attach it to patchwork. Sending a patch to
> > the BPF mailing list has their patchwork trigger a bunch of tests and it
> > will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> > add it to patchwork and the maintainers will ignore it.
 
> > Attaching AI to patchwork could be useful as well. But this would run on
> > some server that someone will have to pay for. But it will not be the
> > submitter.
 
> Just to clarify, that's what already happens with BPF today.
 
> Ex: https://github.com/kernel-patches/bpf/pull/9962 are all from the
> review prompts.

This almost relieves me from the guilt not to have reviewed that series
from Alan ;-\

- Arnaldo

