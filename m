Return-Path: <ksummit+bounces-2463-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E8BC9A22
	for <lists@lfdr.de>; Thu, 09 Oct 2025 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB96735358E
	for <lists@lfdr.de>; Thu,  9 Oct 2025 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5766D2EB5CF;
	Thu,  9 Oct 2025 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CJaVUFaR"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BCE1D95A3
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021514; cv=none; b=sIpfndxMIhVFb6Zfh38hz8GpEbliyDuL8JvJPP7GjhikYbdE7NxAmBM2Ydyod73EAHhy4bORqjFL+pb33IfmWjprueNEq1LsWVNdiGd9gjWf9UVgHwzW/PXZ0qZBZCk96ZORHTwLAG+tQfW+kcy+Wiaah+Fd+44qy+S1lMH6Pv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021514; c=relaxed/simple;
	bh=r968EebDSbo/HNZ0vJR2lAF35rXcEPRBtmazaOk9vRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJx/58t8V/64BS7FdITE37rFs9delYybLxaWjZE0dYElJsQULj5uHFfcIzZHJQ6MX/6ttIWdy3kq8nOv4NTqWzbGFXs0sm0WxltlMjDApw8buNJUQs0ws3rn28fb5IJIhF4At2FIeLNz8yZvDQ2W1Y0Qw/Nfo1lRQT1n7E5WnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CJaVUFaR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2igSlKDCijAfHDovoXQr3SLcdqnE+ycc1LTY0P/NNRY=; b=CJaVUFaR6olevgYO061PQSLgQ/
	473sjexJ9gnASMQ8szrWUsZ0LwvbfUK1X9+4U+4z4nuKJyzuQQOBmTKlnY3C3w4wULcPiE7TDdRAw
	+k9c/6GyMYW07PmBaCeWsXk91ZdxQ6+eESXqXd1gaYH+NKz09Xp/+Wck8bXqA76ucjcI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6rzX-00AXFp-LZ; Thu, 09 Oct 2025 16:51:39 +0200
Date: Thu, 9 Oct 2025 16:51:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Bird, Tim" <Tim.Bird@sony.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009103019.632db002@gandalf.local.home>

On Thu, Oct 09, 2025 at 10:30:19AM -0400, Steven Rostedt wrote:
> On Thu, 9 Oct 2025 12:14:05 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> > Forcing contributors to pay for access to proprietary tools is not
> > acceptable. Forcing contributors to even run proprietary tools is not
> > acceptable. If maintainers want contributions to go through any
> > proprietary tooling before submission, then this has to run on the
> > maintainer side (be it on a maintainer's machine, in some form of CI, or
> > somewhere else).
> 
> One way I see this working is to attach it to patchwork. Sending a patch to
> the BPF mailing list has their patchwork trigger a bunch of tests and it
> will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> add it to patchwork and the maintainers will ignore it.

Not quite, at least not for netdev, which shares some infrastructure
with BPF. Patches get ingested into patchwork, and then some time
later, the CI system will get them from patchwork and run the
tests. The results are then added to patchwork, both as red/yellow/green
traffic lights, and clickable links to the test results. Failing tests
don't automatically cause patchwork to change the status to "Change
Requested", a human is needed to look at the actual failures and
decide if the patch should be rejected or not.

We also make it clear, this is not a public CI system anybody can
submit patches to for testing. We expect patches to be "submission
quality", not WIP. Anybody abusing that will get spoken to.

> Attaching AI to patchwork could be useful as well. But this would run on
> some server that someone will have to pay for. But it will not be the
> submitter.

The netdev CI does not run on the patchwork instance. It just uses the
API patchwork offers to get patches from it, and tell it about test
results. But you are correct, somebody pays for the netdev CI, and it
is not the submitter.

	Andrew

