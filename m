Return-Path: <ksummit+bounces-2257-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632EB3EE4D
	for <lists@lfdr.de>; Mon,  1 Sep 2025 21:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC7B61A87FD1
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1A0324B1B;
	Mon,  1 Sep 2025 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="sXt/sXXT"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B725783F;
	Mon,  1 Sep 2025 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756753531; cv=none; b=OZ0nWL/WslsP/6HFdJFBFJdqysQXiZrm9eOjRfmb6wEiVl0QHhOSrStQL4ZuDnIkokny+fMwZ/nDQj0Y+VxzI2ds9A/mq4xlHC5G3vXy4gFkWnYJC1WnOcqTOReGrFFt6gD9/4L7fP9vNJWNTsMOjoazxLB88ye9hWfTOGDDQl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756753531; c=relaxed/simple;
	bh=O3DTd4VyJqLQvt/WPFyDQcOAW5Rwb8bMay6+3l9Cct8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7xAJRdV9lIJcdgD5gEqw3npxFpvrXOlJaSe5Ul7t9Szu+2bp4SC61uU14AQgDDl1XwM1KCLvHhYaEFYFXctMHspZUkttxWnHmUpKW2AvSEASWBOHb6Tbv6/5uWZwGXxajnUwROKpD3uYtfZNro5fY7WnTxkxkclG9EToDST3Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=sXt/sXXT; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dh+YDnkygf05zbOelaWSnAP6DgZemkY1Q80SnDQvPCY=; b=sXt/sXXTecU44ZWcye2v3GnZyB
	s2fs5MaI6O4rDpO/TXTR+sc3zMVDIiINazkudZuMui9txqSSlpuwIBHXs1OuFB7ymuq9jgBTYHOqw
	o40TR7DPMBSA7rqmfIksGM6bW+AYf2J5SYW8DVzpVccjiDbNZmkTi0JtdlmYMJ0zpdFs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ut9qB-006o3m-Mw; Mon, 01 Sep 2025 21:05:19 +0200
Date: Mon, 1 Sep 2025 21:05:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <4f5b357c-5c99-4d7c-bb16-02556eec074a@lunn.ch>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <20250901203750.33ee6689@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901203750.33ee6689@foz.lan>

> We can run it without actually building htmldocs. The only requirement
> is to have Python 3.6 or above (this is enough to get error reports,
> but 3.7 is needed to avoid having struct/function parameters out of
> order).
> 
> The real problem is that, when we start doing it, Kernel build will 
> have thousands of warnings. 
> 
> Perhaps one solution would be to have an image of our current
> problems on a file, reporting only new stuff by default and using
> WERROR policy, causing build to fail on new warnings.
> 
> This would at least avoid the problem to increase.

netdev has a CI system which is used to try to evaluate every patch
for problems. It builds the HEAD of net-next, and counts the number of
compiler warnings, for the whole tree. If then applies the patches in
a patch series, one by one, and runs the build for each patch, and
counts the number of compiler Warnings. If the number of warnings goes
up, the test fails.

Does the kernel docs have any concept of incremental builds? Adding
one patch and rebuilding the kernel is generally fast, unless it
changes an important header. So the cost is reasonably small for two
builds. But if building the kernel documentation twice is going to
cost 6 minutes, this does not scale.

What the netdev CI also does is collect the names of the files a patch
will change. It runs ./scripts/kernel-doc -Wall -none $FILES, without
the patch, to get the number of warnings, applies the patch and does
./scripts/kernel-doc again and checks the number of warnings has not
gone up. That catches a number of undocumented new structure members
etc.

Could something similar be added to 0-day?

      Andrew

