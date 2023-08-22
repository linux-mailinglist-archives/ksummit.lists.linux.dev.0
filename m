Return-Path: <ksummit+bounces-1051-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C59783EAE
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F15D28101B
	for <lists@lfdr.de>; Tue, 22 Aug 2023 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F9C125BC;
	Tue, 22 Aug 2023 11:25:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6A9472
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 11:25:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBA19DD9;
	Tue, 22 Aug 2023 13:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692703435;
	bh=GmZ1abANTA9TjWIkbK5gz17gj5koD/Y0G3M4ccem8XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNxU25HRlfKmKE0S+uEYA20j+edZbE6mbMKi0TQGEob/ih6Nas74Iugrtkzy4bjdZ
	 IN/MLBJlU8nigV6CjIXww8hhw7LHMJ4JACbfcecuLZinZ06xzHY809JGwa+awZWgqu
	 Ur6Ao4fP4sh7oJr1iHTsvj9Sz+fRq2bjGNuqC5w4=
Date: Tue, 22 Aug 2023 14:25:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Jiri Kosina <jikos@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822112519.GN10135@pendragon.ideasonboard.com>
References: <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <20230821153549.GJ10135@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2308220938500.14207@cbobk.fhfr.pm>
 <30c87cc1-4b9b-6f8f-361c-aa814e750ee7@suse.de>
 <20230822101311.GA6029@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822101311.GA6029@unreal>

On Tue, Aug 22, 2023 at 01:13:11PM +0300, Leon Romanovsky wrote:
> On Tue, Aug 22, 2023 at 11:05:32AM +0200, Hannes Reinecke wrote:
> > On 8/22/23 09:41, Jiri Kosina wrote:
> > > On Mon, 21 Aug 2023, Laurent Pinchart wrote:
> > > 
> > > > > It is not clear to me how to get honest answers without fear of
> > > > > loosing an ability to work with that subsystems later.
> > > > 
> > > > One straightforward (on paper) option is to guarantee anonymity. When I
> > > > was in university, students were given the opportunity to provide
> > > > feedback on teachers, and the feedback was aggregated into a report that
> > > > didn't contain any personal information that could be used to identify
> > > > the students.
> > > 
> > > I understand where you are coming from with this (my university did the
> > > same :) ), but in my view this has a huge potential for not really
> > > reflecting reality. Rationale being: the people who e.g. got their code
> > > rejected will naturally tend to provide negative feedback, even if
> > > rejecting the code was objectively the right thing to do.
> > > 
> > > And vice versa.
> > > 
> > I do see the advantage, but the main disadvantage here is that it's eroding
> > trust between people. Anonymous review tends to be used for
> > negative feedback, and I am aware that negative feedback to maintainers
> > can have a direct impact on your ability to work in that subsystem
> > (and believe me, I have been in that position. Several times.)
> > But in the end if you want to continue to work in that subsystem
> > you have to come to some sort of arrangement here.
> > I do believe that our maintainers are capable of differentiating
> > between personal and technical issues, so it should be possible
> > to work together despite personal ... (issues? differences?).
> > 
> > But none of the above will work if the feedback is anonymously.
> > Maintainer will have a reason for reacting that way, and won't
> > be able to explain themselves properly if they don't know whom
> > to address.
>
> I don't think that it is possible to provide feedback purely
> anonymously, as subsystems has pretty stable number of contributors
> and the feedback that they will provide will allow identify them
> relatively easy by savvy maintainer.

Usually, feedback is anonymized by gathering information from multiple
sources, and compiling it in a way that underlines the main points
instead of focussing on particular personal stories. The process can
also filter out non-constructive feedback. For instance, if multiple
replies to the survey mention a very large time to get patches reviewed,
that's something that can be part of an anonymized report. This however
requires a large enough pool of developers to submit feedback, so it may
not work well in some cases.

-- 
Regards,

Laurent Pinchart

