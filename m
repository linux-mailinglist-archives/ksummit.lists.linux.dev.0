Return-Path: <ksummit+bounces-1021-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17336780F36
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3099A1C21642
	for <lists@lfdr.de>; Fri, 18 Aug 2023 15:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3177418C3D;
	Fri, 18 Aug 2023 15:30:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64C182BC
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 15:30:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 837BAC85;
	Fri, 18 Aug 2023 17:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692372564;
	bh=buADElh1KjhL97do2nIxHHDyCqf0KQiIH/Mn4+Lt9Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSzrzNpnypdAoWu+VMtctGLGcW2n0C7N2jw0UrENJHsbNqVl7mbTdferAQuXF+oVX
	 SJ1qAKk0q4AOybsSnrljMlwzBxIbXMvqWZbjF3eFbuR46kyo3vlLe+B/mPgU5AgsSO
	 zMNNUJUYUqZis9sPi3JTGsUtcbfrcP4xJ3olMWV8=
Date: Fri, 18 Aug 2023 18:30:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230818153045.GB13558@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
 <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
 <20230817150336.GJ21668@pendragon.ideasonboard.com>
 <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>

(CC'ing Greg)

On Thu, Aug 17, 2023 at 07:41:43PM +0200, Miguel Ojeda wrote:
> On Thu, Aug 17, 2023 at 5:03 PM Laurent Pinchart wrote:
> > On Thu, Aug 17, 2023 at 03:56:43PM +0200, Miguel Ojeda wrote:
> >
> > > I think the bot should simply reply commenting on the issues it has
> > > found, without judging whether the patch should or should not be
> > > reviewed (and the bot could perhaps explicitly say so to avoid
> > > submitters getting discouraged).
> > >
> > > Then, depending on what the bot finds, i.e. the amount and kind of
> > > issues, reviewers can decide and reply as needed. RFC patches could be
> > > skipped by the bot.
> >
> > This defeats a little bit the point of lowering the workload of
> > reviewers though, if they have to review each bot report and reply to it
> > manually :-)
> 
> No, it does not. The point is that you don't need to point out trivial
> mistakes anymore, nor devote time to find them.
> 
> Just by judging the length of the bot's reply and the importance of
> the spotted issues, you can make an assessment.

But you'll still need to reply to the submitter to tell what to expect.
As far as I understand, this was considered enough of an issue by Greg
to be automated to remove even the human need to push a button, see
https://github.com/gregkh/gregkh-linux/blob/master/forms/patch_bot.

> And, of course, you can also group particular issues as "no-go", so
> that the bot already says there needs to be most likely a new version
> (e.g. no SoB, no license, no commit message, bad formatting, build
> errors...), suited to the particular subsystem.

That would work for me, and I think that's essentially what Greg's bot
does.

-- 
Regards,

Laurent Pinchart

