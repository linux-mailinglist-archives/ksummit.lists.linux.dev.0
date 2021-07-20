Return-Path: <ksummit+bounces-424-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B33CFB5D
	for <lists@lfdr.de>; Tue, 20 Jul 2021 15:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 547281C0ED0
	for <lists@lfdr.de>; Tue, 20 Jul 2021 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7361F2FB6;
	Tue, 20 Jul 2021 13:55:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9972
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 13:55:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id DDB632B01196;
	Tue, 20 Jul 2021 09:55:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 20 Jul 2021 09:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=HeOJmhJYEha8O6jJOj43PEeyv5k
	I2uVIobp836Kwloo=; b=ViXRnwp0I7g0wHaMAKK/lk/5SSvXCiArcKvx6yVa09x
	k+q9uScS0cHNLyGpCqU+4kPLryrh81AaQGTeu8WTE7vqEofaApuJjNgpx6rTMoZD
	mXnzv/wr84MGhcHRxxynvySWB+y0GAqZfJ5NOLkcdmBmf98pKYcEPLv4sFnHxCiy
	96g7YmdgXAaAN0HpyOFn2JMbo9GRqVqOuGU96CQsG6+nGBWSRZ4JdDbbt2tfsguT
	jD2lj15+sJ0+YzTiqFDyC2bO0eD56Zsn+SvOMifdU55ztxZqRnVPJGWVHYaQb6s2
	/BNrolofm7PmEjMX7hxmZVFX9Az2gBzgNPXCHdVqhYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HeOJmh
	JYEha8O6jJOj43PEeyv5kI2uVIobp836Kwloo=; b=LKNSVpWab/1MVk9VAPt3xt
	Vb2ULPnCZfcKi41UmRDOLMGiZG81BzQ3O/8YoAA74NJXuARzMz+tAbQX14c/t/KK
	6X1bYX+ToJSLl5D6gmwzfQGM+6lxL/6fI6T808aDVW6yv33H6M9PAZ9rI7f9IJLy
	DRNtsfMgooPII5V0BPYaEGJOvlUsJUK8md2UwjzimVnxk/1bGnL4spxydTxBL6I8
	/2AfpCBaLwavQ3ysCpf35xt6v4QGf+eTiXs+PgaMCSRB9N9pCJQRztMvLDXmIe5h
	I2ZKFmHwcGM8F8yP5R7JGO6rxbdgD0uZmOYij6Dyn9DZ9rXZsQNRBMuU4+FN0Z8Q
	==
X-ME-Sender: <xms:4NX2YAbar3RlU5qCMsK2CKz7IJIVkDkXGCiKO6gTHCNIERk3Ubgzug>
    <xme:4NX2YLZUPyar6K2cC_mEnedQVtL75rXrc8ctp1_Grz8EXpfwqhnt1evjOaLI4_az5
    YlbDdZFn6UMBg>
X-ME-Received: <xmr:4NX2YK_tOhJiuf2O2WalXo1WC7ito5_nn83kODWhQ2ksEmUaBA_LE4tDplAGK6DUVOogts-My0ZlGO_SwiF4dNsbbl7ChGRR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnheptedvuefhje
    eigfdukedtieffkeffiefftdfgudfghfevgfetudejueejveduveevnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhdpghhpihhordhrshenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:4NX2YKrZ2dgvb32Dne8SdXVW62QoNiKzanp3tu4N2SK1q2KrRWGf_A>
    <xmx:4NX2YLotTF-F4_5ej7amJmsxCKGhtlv-gcWRWmUSKowSM45jwXHQlg>
    <xmx:4NX2YIQw4_gTOyaTmG8loZCWOsbu72Tt1KH2vCJDnDdWwC8VuStSFQ>
    <xmx:4tX2YFZTLTPgRlc_PXi9SEqwZs9MOLJ-SJ-ZOdPeIRuyJauTnG580vzA08Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:55:44 -0400 (EDT)
Date: Tue, 20 Jul 2021 15:55:41 +0200
From: Greg KH <greg@kroah.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Wedson Almeida Filho <wedsonaf@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPbV3SpHqDIg7Bej@kroah.com>
References: <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
 <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <YPYk4gSGJrGvg+M+@google.com>
 <YPbN3G6qgaeABWEW@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPbN3G6qgaeABWEW@lunn.ch>

On Tue, Jul 20, 2021 at 03:21:32PM +0200, Andrew Lunn wrote:
> On Tue, Jul 20, 2021 at 02:20:34AM +0100, Wedson Almeida Filho wrote:
> > On Tue, Jul 20, 2021 at 12:16:32AM +0200, Linus Walleij wrote:
> > > On Mon, Jul 19, 2021 at 4:42 PM Wedson Almeida Filho
> > > <wedsonaf@google.com> wrote:
> > > 
> > > > > I think people want to see the code inside these classes as well,
> > > > > can we browse it?
> > > >
> > > > The whole tree is available here: https://github.com/wedsonaf/linux/tree/pl061
> > > > -- I should caution you that the two most recent commits are not merged into the
> > > > rust tree yet because they're WIP. (I'll clean them up and eventually merge
> > > > after the feedback from you all.)
> > > 
> > > I found that the gpio_chip C wrappers lives here:
> > > https://github.com/wedsonaf/linux/blob/pl061/rust/kernel/gpio.rs
> > > 
> > > This file is very interesting!
> > > 
> > > I think it's not a good idea to keep these wrappers in their own
> > > rust directory, they need to be distributed out into the kernel
> > > everywhere they are used. We have made this mistake before
> > > with OF (device tree) that started exactly like this in
> > > drivers/of/*, and now I have part of the OF GPIO handling
> > > and tests inside files in that directory as a consequence.
> > 
> > That's great feedback. Our plan was to have the core parts in `rust/kernel`, but
> > once maintainers got involved, we would place things where it made more sense.
> > Since we have no maintainers involved in development yet, everything is in rust/
> > for now.
> 
> Part of the issue here is -stable and back porting fixes. If files
> move around within the tree, it makes this back porting harder. git
> cherry-pick is a lot less likely to work, it needs more manual
> intervention. I expect it will make the stable teams job much easier
> if these files are in the right place from day 1 and never move.

Files move around every release, it's not a big deal for stable
maintainers.  Just do not do it for no good reason.

greg k-h

