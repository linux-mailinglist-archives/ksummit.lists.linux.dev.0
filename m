Return-Path: <ksummit+bounces-418-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E93CF510
	for <lists@lfdr.de>; Tue, 20 Jul 2021 09:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 26D171C0DC5
	for <lists@lfdr.de>; Tue, 20 Jul 2021 07:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282722FB6;
	Tue, 20 Jul 2021 07:09:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC870
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4mUT5rWlwn1kOb/3Tu1/H0isX2faAZyxrEyzWsb8lhA=;
	t=1626764974; x=1627974574; b=kskB9PcFwu/j3lx9Uf8C0cxxiSKmE3lU0lXUhQd4TVsq8v/
	PNQXGKONwuaPGJiwSJ2hFu9D2uxyN+9/XGqVXFEDPScAXbuJaEbjQerm+w6uMZS4uOLRvyFBaMQXY
	x5BE0N3pO9vMFj72R0v0rlbcNngNWoofL7lYtbuv2N6lt9YS+zwIev/n8WgRh3PykOfXPV+97XcJS
	HzgA28hy4AnUQUqt12kgOgwBtBEyzsW7yaAsdBD8EtlkwwfGBdTrz2uvfXz9+F0dU6tWf3GH2Plvp
	l+AiVg15/5R5wWc071vzJI/MvDbbbispSlFtz+yGLFOPdZKXbNSSzaGdkw5mGpJQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1m5jTS-004gFn-9R; Tue, 20 Jul 2021 08:43:27 +0200
Message-ID: <bf6c049af2f51ca584d1c134d4402272651c08f5.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Rust for Linux
From: Johannes Berg <johannes@sipsolutions.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann
	 <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wedson Almeida Filho
 <wedsonaf@google.com>, Greg KH <greg@kroah.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, Jan Kara
 <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
 Julia Lawall <julia.lawall@inria.fr>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>,
 ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 20 Jul 2021 08:43:22 +0200
In-Reply-To: <CANiq72mQ4+Z0Q4uBs0m7R5eFBAohQNzTcJMAXPqh=sOCVJa+=g@mail.gmail.com>
References: <YOX+N1D7AqmrY+Oa@google.com>
	 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
	 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
	 <YOdJLYmUkoMyszO7@kroah.com>
	 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
	 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
	 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
	 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
	 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
	 <CACRpkda8cD+BOjgE996PGDG8Tb9_7wV8j3AkTkYPLMmW9OS+iw@mail.gmail.com>
	 <CAK8P3a0EjQesQi1mUq5D5ATYMW+sy6gAxNbsE8Sq9vU4j5UrCw@mail.gmail.com>
	 <CANiq72mQ4+Z0Q4uBs0m7R5eFBAohQNzTcJMAXPqh=sOCVJa+=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Tue, 2021-07-20 at 03:46 +0200, Miguel Ojeda wrote:
> On Mon, Jul 19, 2021 at 11:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > 
> > I'm worried that this makes things harder to grep for, and to document,
> > when the same structure is used in both Rust and C.
> 
> For the former, by grepping you should find the Rust abstractions that
> use the C structures, because binding generation does not change the
> names or their case. Of course, the Rust abstractions on top of that
> is a different matter, but those do not exist in C anyway. So, at
> least for the use case of searching Rust abstractions that use a given
> C structure or API, it should be fine.

Keep in mind though that there are at least two different use cases for
grep:

1) I need to change the API here, need to find all the users - I agree
   this is covered here.

2) I need to change the semantics (e.g. locking) and for this I need to
   find all the users and analyse their use (e.g. locking-wise), which
   now becomes an exercise in digging through the abstractions and doing
   a kind of "indirect" grep for the next level.
   Not that this doesn't exist today (e.g. some netlink APIs I changed
   in the past have some abstractions in some subsystems), but it does
   make it more complex.


johannes


