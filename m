Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FF7E29BC
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF61DB20C03
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE029416;
	Mon,  6 Nov 2023 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V7j24RE/"
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD024214
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E483DC8513
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 16:29:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F00020010;
	Mon,  6 Nov 2023 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699288174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2cAS9IqLSrnB2aAcJ59/rg++NroJ/ZUKz4wPWS8R1iA=;
	b=V7j24RE/iEfuxrD7EM24DbRSjhZm+XKSy/sWS+RKZq/OPj4Zw8LHY4RwajupILLlay0VCT
	ukv5umrV8imLg0uqi5h5cvKoT8dsMefYCoNosj4fomiNcGzrHp85Rn/SWiY7WBEpJSwDWN
	WmjxFZL+EacTBAjDTZ/0bZMIiK41H0qCZdqbJQPFhPR3ju619JZ5I24E+x5IriwyxpBR5o
	WeyipLBIScfW+NJY2Wu8NXxq6BcYemUo9FgdDnOdKLOM/a8wREYShHtUq8SAT2ozlffm7Z
	rcOuF0mGxyOB7J+20eWdChjODjkS/Xb5qo3hLLcKNje4TbTQLZ/519gDe/b8GQ==
Date: Mon, 6 Nov 2023 17:29:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106172932.01bce954@xps-13>
In-Reply-To: <20231106110547.6956a430@gandalf.local.home>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<20231106110547.6956a430@gandalf.local.home>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Konstantin,

rostedt@goodmis.org wrote on Mon, 6 Nov 2023 11:05:47 -0500:

> On Mon, 6 Nov 2023 10:33:21 -0500
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
>=20
> > For this reason, I propose switching the "F: *" entry in MAINTAINERS=20
> > ("THE REST") to patches@lists.linux.dev instead. This list differs from=
 LKML
> > in the following important aspects: =20
>=20
> As long as it doesn't affect those that have L: linux-kernel@vger.kernel.=
org
>=20
> All core kernel changes should still go there.
>=20
>  (Scheduler, timing, tracing, interrupts, etc)

There are many MAINTAINERS entries without explicit mailing-list which
are not really 'core kernel' areas. If we consider
patches@lists.linux.dev as an archive-only list, then
maybe get_maintainers.pl should somehow fallback to
linux-kernel@vger.kernel.org anyway when no list pops-up?

Thanks,
Miqu=C3=A8l

