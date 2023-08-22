Return-Path: <ksummit+bounces-1048-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D8783DB8
	for <lists@lfdr.de>; Tue, 22 Aug 2023 12:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 123B21C20AA2
	for <lists@lfdr.de>; Tue, 22 Aug 2023 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228819457;
	Tue, 22 Aug 2023 10:13:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440211736
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14881C433C7;
	Tue, 22 Aug 2023 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692699195;
	bh=GsMwBtpAUsDaA15ac6aXzvMYrp2wZv8XRFkYRmO8BQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJN7n4PuQC52C6g71PQ2aRc6S+sDfFfTBGgD2V7iSMFNhLLq1BHzhvLzv2B/t+jas
	 sMux2+TT2+jx+WaXLamNyHanjWoHCNJ2StYyEWloUsTzdnjWtDtU08wgeZY1coymNh
	 /7H8WAkMW3pFZlzk86LkPW1oWw6oK2KXHWzu8vZjCJ4ozZ4UVY37UXKQacWsWG7eP7
	 /tXYgo8Ocp5+X4IJHeKDlSPLhe7Uhh152H5t2YZXuNXrILTy+UDBwSN4YFGyjGh39O
	 Rk9CVr27nH++29V1wN7WXt7EkiiEeWxwIfZ/+WnfuQtTrPTz1wOiE6WKLj3nPK4xLB
	 3aAUra84UOmJQ==
Date: Tue, 22 Aug 2023 13:13:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822101311.GA6029@unreal>
References: <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <20230821153549.GJ10135@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2308220938500.14207@cbobk.fhfr.pm>
 <30c87cc1-4b9b-6f8f-361c-aa814e750ee7@suse.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30c87cc1-4b9b-6f8f-361c-aa814e750ee7@suse.de>

On Tue, Aug 22, 2023 at 11:05:32AM +0200, Hannes Reinecke wrote:
> On 8/22/23 09:41, Jiri Kosina wrote:
> > On Mon, 21 Aug 2023, Laurent Pinchart wrote:
> > 
> > > > It is not clear to me how to get honest answers without fear of
> > > > loosing an ability to work with that subsystems later.
> > > 
> > > One straightforward (on paper) option is to guarantee anonymity. When I
> > > was in university, students were given the opportunity to provide
> > > feedback on teachers, and the feedback was aggregated into a report that
> > > didn't contain any personal information that could be used to identify
> > > the students.
> > 
> > I understand where you are coming from with this (my university did the
> > same :) ), but in my view this has a huge potential for not really
> > reflecting reality. Rationale being: the people who e.g. got their code
> > rejected will naturally tend to provide negative feedback, even if
> > rejecting the code was objectively the right thing to do.
> > 
> > And vice versa.
> > 
> I do see the advantage, but the main disadvantage here is that it's eroding
> trust between people. Anonymous review tends to be used for
> negative feedback, and I am aware that negative feedback to maintainers
> can have a direct impact on your ability to work in that subsystem
> (and believe me, I have been in that position. Several times.)
> But in the end if you want to continue to work in that subsystem
> you have to come to some sort of arrangement here.
> I do believe that our maintainers are capable of differentiating
> between personal and technical issues, so it should be possible
> to work together despite personal ... (issues? differences?).
> 
> But none of the above will work if the feedback is anonymously.
> Maintainer will have a reason for reacting that way, and won't
> be able to explain themselves properly if they don't know whom
> to address.

I don't think that it is possible to provide feedback purely
anonymously, as subsystems has pretty stable number of contributors
and the feedback that they will provide will allow identify them
relatively easy by savvy maintainer.

Thanks

> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                Kernel Storage Architect
> hare@suse.de                              +49 911 74053 688
> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
> HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
> Myers, Andrew McDonald, Martje Boudien Moerman
> 

