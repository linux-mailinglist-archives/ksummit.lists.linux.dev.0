Return-Path: <ksummit+bounces-353-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BE3C1958
	for <lists@lfdr.de>; Thu,  8 Jul 2021 20:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6457F1C0F39
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625692F80;
	Thu,  8 Jul 2021 18:44:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46016168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 18:44:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 609B95802EE;
	Thu,  8 Jul 2021 14:44:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 08 Jul 2021 14:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=tglIgWWjsfK2KZ2/cibY8KMX88L
	H0NzaE9ibLGpyfIs=; b=I2ECQe84I6UmpvjBlVroeVnstz5Md1uOiK609KEr8q7
	vcqfeX5oXZoP2JJVikcySJaT0SbW3EGjMHyQOv15HkpaeK8q2qRIVTil/vep9bW3
	f/sY5WUjTtrZ4/AgJ8OXf7xDw716V3+SXbhPB9eHbq+FdBV373yxL8V8xGYkwiIf
	Xuy7LETiGaL8x4x/i+rg5FEEuPQMt7sPujTPiV9DWdK1vUuKpvU9MoZsAb5mYwco
	GYFH76BdSbUR8V40ZPk9fpXdwipqsLohyeXo40eBW68jboolDrAfY7ndaaASfZmR
	8p/daT5ZYO2dOL/ye4BBljZB71ajuG7qskneoOFG1Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tglIgW
	WjsfK2KZ2/cibY8KMX88LH0NzaE9ibLGpyfIs=; b=mKSd4kW9CxpxA90pFgIZH4
	DynbGRWV+igtOm+LcyA656AZjYnOceksiNtrOJUDFTtwWrtrdl5OC1ji3PRk9Ux9
	TmJvdlogi+CTbHOg9F0F3KwbeQMrOTRuctEa/mlPqmChYJla5UW1z0OHKr2Bg5rV
	vzxAwnJS8LzP3zF+hHfsoZGu+gu0MVlnfZ08mhGNoAD+Vvva0okOodrXN8CptQnD
	q9atjiFobiG7K7i/dGxa58OFGm2ipzndXgc+a7MO/NLl3va48PxZD3ax7ZMVYD4l
	R14TDJFnQNlqhCybqjVJwvrvK/a3aHcBi7PCStXg0jQbK+1Q/SSsBpbC+Tc0LkVw
	==
X-ME-Sender: <xms:e0fnYJLxPJyT_qfSqYYtvepzGk2pvDOEklK9dz8_K8OL2COzXFjOQQ>
    <xme:e0fnYFIjit0GriZPTW3gTQGLP8Xs-kSGGcGaqC80Zu91dmqLh-XkQu2PMBOguPywl
    EtNLUuLDt57kQ>
X-ME-Received: <xmr:e0fnYBsOhRL_EXoP5_tX5X_6Lbm9ruTaghmzGNRWm3iELo-0U8hCQx-aTxwFLhu3Hs95ilU65qyL-iic99zIO6yiOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:e0fnYKavGh3yMKw1dRs6e7awZxVsregnAGnsPJ0jRGNdm28hFULFXA>
    <xmx:e0fnYAayd3tjW57liAhI4wuozKAYI7DEsvwTe-TSSfYDgPG7K1IeaA>
    <xmx:e0fnYODMVu7El2WiG5BA5G-GRI_zZo0ndK5VJ4RnI3UAp6rH5eTS1w>
    <xmx:fEfnYAIHJoBfxjift6GotcInzK5LtLO19MJcbUIUkYOxaUX8QwuTTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 14:44:11 -0400 (EDT)
Date: Thu, 8 Jul 2021 20:44:09 +0200
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOdHefpRd7isNrZr@kroah.com>
References: <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
 <YOcSo3ilu+ACDnBJ@kroah.com>
 <CANiq72mGRPqZEB2vTPxP4L5nNc-_0s2d=zCMi1BiVZHjPkeBnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mGRPqZEB2vTPxP4L5nNc-_0s2d=zCMi1BiVZHjPkeBnA@mail.gmail.com>

On Thu, Jul 08, 2021 at 08:00:15PM +0200, Miguel Ojeda wrote:
> On Thu, Jul 8, 2021 at 4:58 PM Greg KH <greg@kroah.com> wrote:
> >
> > Ok, great, then how would you handle the kref issue where you need an
> > external lock to properly handle the reference counting logic in Rust?
> > Why is C so "bad" here that we require a lock but Rust would not?
> 
> That's the thing: neither C nor Rust need a lock to handle the
> refcount itself, i.e. `kref` does not contain a lock, neither `Ref<T>`
> does.

kref does not contain the lock, but you need to use a lock lots of time
when dealing with them.  See my response to Andy for why.

> A lock is needed when you actually interact with the contents that are
> refcounted (see my previous message about `Ref<T>`) -- and this
> applies the same way to Rust and C.
> 
> What Rust is buying is, though, and this is the critical point, is
> that we cannot make a mistake forgetting that we need to have some
> form of lock to concurrently mutate things nor forgetting we need to
> actually lock it.
> 
> Thus, in a way, you could think that the rules in `Doc/kref.txt` would
> be now enforced statically -- that is the difference.

Ok, fair enough, thanks.

greg k-h

