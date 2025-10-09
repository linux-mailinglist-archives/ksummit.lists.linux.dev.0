Return-Path: <ksummit+bounces-2469-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FFBCA5DB
	for <lists@lfdr.de>; Thu, 09 Oct 2025 19:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2524278B3
	for <lists@lfdr.de>; Thu,  9 Oct 2025 17:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4AA24113D;
	Thu,  9 Oct 2025 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADulnOhQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2713A31
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760030655; cv=none; b=O2TLXkAWMrzbOYgQvrrIQyAA5TYlJ53v/+RIh2nOK/WGIXQAMfpeRIjLBW1dluOgdRIW3PJ7+tsismPEyFqzU9XMwdaded2nv2F5SyG3CCpnAM3OOwYwtkwT3oWWiudQj+/yxP8uTQ57wdUsfq6b5WbMvhJ7NPIk4JeIDf5HpoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760030655; c=relaxed/simple;
	bh=nf6VYyK+PT5Wwn2IIFzvUx/qkLzoxp5wkm6nghLCx4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpODd0xcCIIynaua6qF2Wbq+R7s9AkMWRyJofSJfVdkJ+2F2go444wlPfAdwVsKa0Cq4LdcrdI7Pat2AanUynb/4T1l1RxoA9pe5RMaYyTcqYgEmm0otZiggcS1QJN9TWC2XzAz9BYNIJR4OgKuNpdlqcQ/LZwtWtxtM/zDTXK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADulnOhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08E7C4CEE7;
	Thu,  9 Oct 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760030653;
	bh=nf6VYyK+PT5Wwn2IIFzvUx/qkLzoxp5wkm6nghLCx4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADulnOhQDbZ1BMl8CyKAOahyTEaGOCS0Z3t7XG78JiOretbPgPJzlc2JMnWy4qDSr
	 Hfy0V9xSiALlc9HID+j9yO7v6KBr2p6urZ9S8DX01wRM629dnR0710oiIaRgnWmx6s
	 JakdwhhZkB1LItsi6GFyGppYIdtUvrxjAgAr0liUXHyuZl6qOzsnFMqshJXKezYBmU
	 y64unHx0TPl7sybI+Mq624jbCk9svQZOoOE7ClVQWMs/x7Za6kcnODHvvVJz6A5zDq
	 RZoStMg3u7krRGwQyVqUZug7lpEWv/qpjgB6JA/gZCCU1hdwiFziGdI+62HAWRQuA5
	 +rJQ8xq2G4MPg==
Date: Thu, 9 Oct 2025 14:24:10 -0300
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
Message-ID: <aOfvuqPNLtBPlc2r@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>
 <aOfuu8InYEUIZdWH@x1>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOfuu8InYEUIZdWH@x1>

On Thu, Oct 09, 2025 at 02:19:58PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Oct 09, 2025 at 12:31:48PM -0400, Chris Mason wrote:
> > On 10/9/25 10:30 AM, Steven Rostedt wrote:
> > > One way I see this working is to attach it to patchwork. Sending a patch to
> > > the BPF mailing list has their patchwork trigger a bunch of tests and it
> > > will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> > > add it to patchwork and the maintainers will ignore it.
  
> > > Attaching AI to patchwork could be useful as well. But this would run on
> > > some server that someone will have to pay for. But it will not be the
> > > submitter.
  
> > Just to clarify, that's what already happens with BPF today.
  
> > Ex: https://github.com/kernel-patches/bpf/pull/9962 are all from the
> > review prompts.
 
> This almost relieves me from the guilt not to have reviewed that series
> from Alan ;-\

But this goes back to "developers should run these tools before
submitting upstream", which would provide them with reviewing comments
that would improve the quality of their pull requests by using all the
money that is being dreamed into AI and would saved all of us from
looking at github, etc, before AI is satisfied with the quality of the
submitters work?

Its all about what should distract maintainers (humans?), no?

- Arnaldo

