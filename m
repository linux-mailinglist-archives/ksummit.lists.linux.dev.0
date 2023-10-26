Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2217D83E0
	for <lists@lfdr.de>; Thu, 26 Oct 2023 15:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C05282043
	for <lists@lfdr.de>; Thu, 26 Oct 2023 13:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE782E401;
	Thu, 26 Oct 2023 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oQW5ppm0"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D72D049
	for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2AEB83B;
	Thu, 26 Oct 2023 15:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698328297;
	bh=A2vHpdr0ECWoEbHBnmZKVT1XwZOPDdxA2pul7Xe1tD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQW5ppm0HRdGsbwA0u1mJ/Lue6P51k+5HRX1Fhp5Kv2uHCySU+okzuvDeoUcGfZgb
	 hPQF1YKn907KyTKOktX+RVVyVbgzh0ObBslW20at4MfjpUT3nfSnmGZ/SIC9l0jJzU
	 eKp+WiHqBFv3XYaaL6ug3mUpl/zeO0BNSKLdnJlM=
Date: Thu, 26 Oct 2023 16:51:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christoph Hellwig <hch@lst.de>, Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <20231026135155.GD26306@pendragon.ideasonboard.com>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de>
 <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
 <202310201127.DA7EDAFE4D@keescook>
 <20231026100148.GA26941@lst.de>
 <c7445b16-27c9-4182-8b0a-4272ddd2d341@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7445b16-27c9-4182-8b0a-4272ddd2d341@lunn.ch>

On Thu, Oct 26, 2023 at 03:44:22PM +0200, Andrew Lunn wrote:
> > > > [1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify-string.h#L292
> 
> I found that https://elixir.bootlin.com/linux is the best way to find
> Documentation for functions and structures. I would suggest try it
> first, and only when what fails to start using grep.

It's painful to have to open the HTML documentation generated by the
kernel build system when developing, and even more painful to have to
use a particular website. If the documentation is difficult to locate in
the source tree, we're doing something wrong.

-- 
Regards,

Laurent Pinchart

