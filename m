Return-Path: <ksummit+bounces-399-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30C3CDE86
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7B7771C0F55
	for <lists@lfdr.de>; Mon, 19 Jul 2021 15:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E662FB3;
	Mon, 19 Jul 2021 15:48:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0E70
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lz57vbxJlpyr7PWU7WoUY9IjTJ6kwb0zylXx9DVOaJc=; b=wUP+z7WekgrovzNdVPrz5g696S
	KlnsGN0ymVMbGjLFqVkRdUQ5WHMQukdQB+vNtXFzgHXoM1b82ZRxXd0nh1hlWKMpzgi7HaMAaRXBN
	hDQFKOWBN2wPP3mG/MLaZX9jhkCn8q3IrIldg/yGENLgGp22cTvArPO8eZ7wD/m1Peko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1m5UzE-00DubP-FE; Mon, 19 Jul 2021 17:15:16 +0200
Date: Mon, 19 Jul 2021 17:15:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPWXBANGbaIO2ila@lunn.ch>
References: <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <CANiq72mAYE6Wh8AikfuuNm8Asr4+c90_bYbj8XdBGJ1Pb4kzvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mAYE6Wh8AikfuuNm8Asr4+c90_bYbj8XdBGJ1Pb4kzvQ@mail.gmail.com>

> For instance, the driver developer could write something like this
> right in the Rust source code:
> 
>     memory_map!(
>         0x0042  simple_value  2  value(u16)
>         0x0044  some_flags    2  flags(..., FLAG1, FLAG2)
>         0x0046  custom_type   1  value(MyCustomType)
>         0x0047  across_bits   2  [
>                                    0..2  other_flags  flags(FOO, BAR),
>                                    2..4  _            unused,
>                                    4..31 temp         value(Temperature),
>                                  ]
>     );
> 
> And then simply call:
> 
>     driver.map.read_temp()
> 
> and it would automatically perform the shifting, masking, unit
> conversions, etc. to get the raw sensor data into a value in proper
> Kelvin.

Hi Miguel

Can you express endianness here as well? There are often cases where
the hardware is always big endian independent of the CPU
endianness. Some of the readl/writel macros handle this, adding a swap
when the two don't match.

     Andrew

