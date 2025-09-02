Return-Path: <ksummit+bounces-2270-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A073EB3FFCE
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727C95E1B3F
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2233D2FFDFB;
	Tue,  2 Sep 2025 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="e4i6F5S3"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF42F999F;
	Tue,  2 Sep 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814675; cv=none; b=VPwNizHt+tFjF6hNqUu2IFccz1PhuZYuv880yk+b79bYlERZprj24DcpV25XaNHcRhNN8yncU3o/SdmwSrJ9GJ5xT8vLSahSKYEnVdEhrHm5DZzIre/u7DOEQ3X3J1SUPVjf+FHSMXxa2rjt/5/g22t3DBpHluc5RdSrDTQ1Wag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814675; c=relaxed/simple;
	bh=f3gHyZtj9B0/RWYfmYne4zsATnu8dvsnFPl3RIZtQlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVZcGUgDDL7T/tJCwK1F+0HA3BwOBfvXqkpFFbZi0khnOGfO/nJa64YCA40X/HmJjoSnW+qWNBpzol9d2MlTCuPqswgmnahYxmhIvjV+zVurfmICWXpWAyG1hA+V22e5oLBUuNlgR4KFk/AsMswquQwpM08Ktgq0jcacQMukI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=e4i6F5S3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=he+PZ28vp52zu2FIvCZJFgb16HNGq1mNg/D4AjN9QUM=; b=e4i6F5S3v5SCqQrrutVe4h+wiK
	XFZa/PS1YBeLMBmebq+kxRrgMQPfHutT+wBK0A4c8aSWsJAuFBTWLMepCbeyc0wTVKG8E6v6t4dHv
	fWWYa2DJ/bvur0OXk2GvjTxJ1QrR+vHRyAYb/IOO5X9ABWvmQNoWjI72uaXaAA497qIM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1utPkG-006sYy-6k; Tue, 02 Sep 2025 14:04:16 +0200
Date: Tue, 2 Sep 2025 14:04:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <c83b8c85-a1a9-4d49-b25d-b4735d72130a@lunn.ch>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <20250901202635.426d099a@foz.lan>
 <6041c6f82863fa3c8e63b37a43ce984bdb1fc6e1@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6041c6f82863fa3c8e63b37a43ce984bdb1fc6e1@intel.com>

On Tue, Sep 02, 2025 at 01:55:48PM +0300, Jani Nikula wrote:
> On Mon, 01 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > On media, our CI builds with W=1, and aim to have no warnings.
> 
> How do you filter out non-media W=1 failures?
> 
> I'd love to be able to tell contributors to use a certain kernel config
> or command-line for build, and tell them to fix *all* warnings, instead
> of teaching them to ignore most of them.

I cannot say anything for media, but for netdev we have the count
before and after the patch is applied. If the count goes up, the test
fails. We also generate a unified diff between the outputs, which is
enough to be able to tell the developer what they missed.

In theory, anybody can do the same on their own devel machine:

https://github.com/linux-netdev/nipa

I've no idea how many developers actually do.

	Andrew

