Return-Path: <ksummit+bounces-2466-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E491BC9B54
	for <lists@lfdr.de>; Thu, 09 Oct 2025 17:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6143B7EB4
	for <lists@lfdr.de>; Thu,  9 Oct 2025 15:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6432EC0BA;
	Thu,  9 Oct 2025 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZIvH7eAC"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166E22472AE
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022679; cv=none; b=dnZdKOb/xYpH+DtxivEkms3ZrQ6j1C0AzrA1UlWH8em59u1BtNXIdFl7WUYFOJ1d1bL9X9yw0TSYkzxfVARrh/EjwEc6GkeVsWuGcfL+sJIMH0AzoOTPETINSfXA5UCaYy4rwbSxNqCXNR9vksexMIC7ywN3R2ab9Z6ZM/gttpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022679; c=relaxed/simple;
	bh=lQmRrEXKEshRn/F9iTOK7VsnHjZzi8kgciIMO4Enkz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SD7GeD0h0CZOCBjI9blR8PJ6WoRdZZOr3urPJI2QaXcE97eDo/fbaYl3OudAzUMqOeWZgopy3RvMUmVKL3Ok0sFBNPjLZHb8vjfd39+izO45Zgz0+JfbumkMdkpxOqEi3oJrDgicX9nt01lKyA98vui+ehthHYzQAEUw3WlDaGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZIvH7eAC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gpuql3qU4qGY6+BQa8jxdZXK3KHT3lihzhdkt9jmo/s=; b=ZIvH7eACPQ0bkkYGafaaB4atkX
	iiBkZ1dDExxx+u1mgRO7cllzdRGatuxVgbmrzfs808EzcpGBcaRQ63BbYmct7CBUr4/RuH0dWVsuu
	8l2AhSSHGVbF+dG4oFnCZRRYK8xCbFBfjVTwS2X/ydUmwYofPLg7SooprVyY6biCYYt4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6sIQ-00AXK7-KM; Thu, 09 Oct 2025 17:11:10 +0200
Date: Thu, 9 Oct 2025 17:11:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <cd6b2e47-a395-4d0d-aa0c-d092ec74ad13@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <MW5PR13MB56323B06E265F10136A1A2B2FDEEA@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB56323B06E265F10136A1A2B2FDEEA@MW5PR13MB5632.namprd13.prod.outlook.com>

> We don't even have the resolve to get contributors to run checkpatch.pl
> (a freely available and imminently accessible tool).
> I think it would be illustrative to figure out what the barriers are to that, or what a proper
> incentive structure would be (and why we're missing it), before tackling the AI review issue.

The netdev CI does run checkpatch, and makes it obvious to netdev
Maintainers it fails. And this results in push back to submitters,
when we reject the patches pointing out checkpatch issues, and don't
bother looking at the patch any deeper. If you hang out around netdev,
you learn it is a waste of time posting patches which are checkpatch
unclean, you are not going to get any meaningful review other than
sort out all the trivial stuff.

> What bugs me about the current discussion is the implication that we're willing to just
> add more cost to maintainers or the workflow infrastructure, when the cost should
> IMHO, be born by contributors.

I partially disagree with this. If you do push back as a Maintainer,
initially only point out the trivial stuff in a low overhead way,
those developers who are going to be around a while learn to run all
the tools themselves. It makes their workflow more productive not
getting immediate rejects with nothing 'useful' other than fix
checkpatch.

But i do agree with you, Maintainers need to also run all these tools,
just to know the developers have run the tool and fixed all the issues
before submission. So there are costs for everybody. But for big
subsystems, it is mostly automated, so does not cost too much human
time for Maintainers.

	Andrew

