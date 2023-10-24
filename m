Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4937D4AF3
	for <lists@lfdr.de>; Tue, 24 Oct 2023 10:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19531B20FAD
	for <lists@lfdr.de>; Tue, 24 Oct 2023 08:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202F8210E4;
	Tue, 24 Oct 2023 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PiFjJc2a"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB5125B0;
	Tue, 24 Oct 2023 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C12FAE;
	Tue, 24 Oct 2023 10:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698137546;
	bh=eC0wg1C0jbKrGc+1IvsfFBgNaqnr8aajGTx78YLd/VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PiFjJc2aTQHIpMrC7hjnTf7+n0OGTXUKOC28rBdK9amF93EA5zp7bl3MQtOi0m6mV
	 XpRZulR+b6mohr2APaaYZiqKWeyFjZeLQD8EYixmqiLa9qDIe6mJM5qaBEDKbi3Rg6
	 HemU7+rT4ZVIyf/MUAipHgq+uj47FclnPx01VPQo=
Date: Tue, 24 Oct 2023 11:52:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024085245.GD5121@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
 <20231024072506.GC31956@pendragon.ideasonboard.com>
 <875y2wbedp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875y2wbedp.fsf@intel.com>

On Tue, Oct 24, 2023 at 11:42:26AM +0300, Jani Nikula wrote:
> On Tue, 24 Oct 2023, Laurent Pinchart wrote:
> > Get a better e-mail client ? ;-) At least with e-mail you have a choice
> > between different clients.
> 
> Yup. What I see is excessive quotes collapsed, replaced with something
> like this:
> 
> [ 18 more citation lines. Click/Enter to show. ]
> 
> All the actual replies stand out, regardless of the length of
> quoting. Now it's just the Outlook style "quoting" without >'s that bugs
> me...

On the list of tasks I will never get to is the development of a mail
filter that turns outlook-style "quoting" into real quoting when
replying to e-mails (in mutt in my case). Does anyone know of anything
like that having been developed already ?

-- 
Regards,

Laurent Pinchart

