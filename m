Return-Path: <ksummit+bounces-425-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 688603CFB8B
	for <lists@lfdr.de>; Tue, 20 Jul 2021 16:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EF06E3E1045
	for <lists@lfdr.de>; Tue, 20 Jul 2021 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1CC2FB6;
	Tue, 20 Jul 2021 14:04:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3244772
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q6TFtqlNed5wHB8q1aBQTiurdHjRpb5zdPSpLrkpX8w=; b=Bu2jDT0vpTQdys+CAeIAHVZEDC
	1Gc0YQ9+P+rjMIlQGvxQjIubghIJI3HSDV9TPkXoMejpcaDvXkw4PvQicj4msqVW4UFC2LGqg97UI
	ivGSqTHa4eRmQbAZ9o6WOkqu+4DpAbX+AeU0ye382QLYpbPpAikzMpPb2r4uyZc9gQoY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1m5qMY-00E3r9-Vo; Tue, 20 Jul 2021 16:04:46 +0200
Date: Tue, 20 Jul 2021 16:04:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>,
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPbX/tPSLehoeJyL@lunn.ch>
References: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
 <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <YPYk4gSGJrGvg+M+@google.com>
 <YPbN3G6qgaeABWEW@lunn.ch>
 <CANiq72kJfQZP24EyOe0qdWQ1xF-0wnfa3Nbz0XtiCe6eu9pgog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kJfQZP24EyOe0qdWQ1xF-0wnfa3Nbz0XtiCe6eu9pgog@mail.gmail.com>

On Tue, Jul 20, 2021 at 03:38:24PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 20, 2021 at 3:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Part of the issue here is -stable and back porting fixes. If files
> > move around within the tree, it makes this back porting harder. git
> > cherry-pick is a lot less likely to work, it needs more manual
> > intervention. I expect it will make the stable teams job much easier
> > if these files are in the right place from day 1 and never move.
> 
> We can definitely move things already if we agree on a particular
> approach -- we definitely do not want to make anybody's job harder.
> 
> An alternative could be stating that Rust support will not get
> backports for e.g. the first two or three releases to give it a bit of
> time to mature in-tree; while making it easier to get maintainers
> involved and in general everything rolling.

Let see what the stable team say about that. But it is well known that
it is hard to separate security fixes out from other bug fixes. So by
not back porting, you are potentially leaving open security issues. I
guess these will be in the unsafe code, and that seems to be mostly in
the files we are talking about.

    Andrew

