Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97A7D83C8
	for <lists@lfdr.de>; Thu, 26 Oct 2023 15:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E27EB2123F
	for <lists@lfdr.de>; Thu, 26 Oct 2023 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D408D2E3F7;
	Thu, 26 Oct 2023 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SyaND0yG"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C232E3F3
	for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7rK2Gdfki2buF/+1fFTKgr/9v5OKh28TcBAEfhAtzbY=; b=SyaND0yGQAPqt81flZS4dBYhle
	vn6XPG4EuXJXpl4O+824HTxahalYMm2NMP2TsavRDixuzk8hf2KKHAgwF039d2HibyhcgC1eXPSIy
	p+/NRTqy+HfHFMYqDP/dmyvFY52Eh1j+7OKo8bMDtXJ9+R8zMZWsve/9cUrFZHmgo2Fc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qw0es-000Fs7-Og; Thu, 26 Oct 2023 15:44:22 +0200
Date: Thu, 26 Oct 2023 15:44:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Hellwig <hch@lst.de>
Cc: Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <c7445b16-27c9-4182-8b0a-4272ddd2d341@lunn.ch>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de>
 <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
 <202310201127.DA7EDAFE4D@keescook>
 <20231026100148.GA26941@lst.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026100148.GA26941@lst.de>

> > > [1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify-string.h#L292

I found that https://elixir.bootlin.com/linux is the best way to find
Documentation for functions and structures. I would suggest try it
first, and only when what fails to start using grep.

       Andrew

