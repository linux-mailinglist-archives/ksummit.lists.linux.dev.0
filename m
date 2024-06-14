Return-Path: <ksummit+bounces-1277-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A32908E07
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2A21C23214
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB7B29401;
	Fri, 14 Jun 2024 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cvxZzJX3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061261FCC
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377092; cv=none; b=ZXZvbdersCU1LGmzLywPH7PLkmQ5OWhrTBf+HbQd/5PZBic+HGHACSLWDM3o+md1zUi9zoWJ84JNjwc/s2Q+MBVTIM77r+8Y5ZTq9TZdOOmMoBRAH07KEio1zIgJXNPWlObKCG/7s3ZNfXjJJaoXFWFQQrnSbrV7gX3NQUR4DII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377092; c=relaxed/simple;
	bh=gG7xsQExcRw+3SU+B+OwHej9QuFSA4sroKkj2gtgcsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7Y22EWDEdaUXefKRlcE+o5WkcJMEQwMKK1nCnPvfhCpiAqvEAkz9582s9Fg1A1x1i4F8x2gYx8CDdVeDjx9c4tmuNTBeLnKcGuOq2TTZHEdWHkoWeviiLdOhnPuDEn0tnv5+hyYVfAKxDeKp1mT7L6BHwWOtQ/9CTnxz9Xrgbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cvxZzJX3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21BB62E0;
	Fri, 14 Jun 2024 16:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718377069;
	bh=gG7xsQExcRw+3SU+B+OwHej9QuFSA4sroKkj2gtgcsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvxZzJX3X51ssXFyu9EhI26IVsY/YR99wel3rJd8o2GAfW8lSJsCYX8AuTxsGiPmf
	 HnqtHaKwlv308qoLtz9273QIf3bXVN2bKhie2uQm/fLecWg8YFEB/lndP5jzVZ14KI
	 EsyoFpn+Uv0UEya8d7LVQSk9RJ68DcJRq3c/EpU0=
Date: Fri, 14 Jun 2024 17:57:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614145743.GA9171@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <20240614104351.3385fd03@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614104351.3385fd03@rorschach.local.home>

On Fri, Jun 14, 2024 at 10:43:51AM -0400, Steven Rostedt wrote:
> On Sat, 15 Jun 2024 00:29:09 +1000 Michael Ellerman wrote:
> 
> > Message-Id: sucks, I want a link I can open with a single click.
> > 
> > At your suggestion I switched to using https://msgid.link/ as the target
> > for patch links, eg:
> > 
> >   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au
> > 
> > Which gives the reader a hint that the link is just to the submission.
> > 
> > I don't really care if the tag is "Link:", but it has to be a URL, not
> > just a bare message-id that I have to cut and paste like it's the stone
> > age.
> 
> I just switch my scripts over to Message-Id: and applied it, and after
> playing with it a little, I agree with the above sentiment. I like
> having a link to the actual patch that I can just click on. The
> message-id adds more steps to get there.

I'm sure someone could easily come up with a script that parses the
Message-Id trailer and opens lore.kernel.org in a web browser. You can
then bind that to a key in mutt, and won't have to even click on a link
:-)

Jokes aside, I think trailers should be designed first and foremost to
provide the data that is needed to solve the problems at hand. How to
format that data (link vs. msg-id) for human consumption is secondary.

> I'm going back to the link, but I agree with others, "Link:" should be
> for the discussions. Perhaps we could use "Pulled-from:" ?

-- 
Regards,

Laurent Pinchart

