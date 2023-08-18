Return-Path: <ksummit+bounces-1026-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AE781178
	for <lists@lfdr.de>; Fri, 18 Aug 2023 19:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20DE41C2106F
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E87F63A0;
	Fri, 18 Aug 2023 17:17:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770B6107
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 17:17:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B76A188E;
	Fri, 18 Aug 2023 19:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692378954;
	bh=j2taSrxNzBTgxNU3pKICntffb0B5RwVuebami6OIHbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ri1wTZ4WEMCfKAxHB27HOvPa3CP3cmT4GzltfO/GTyzzx+BD7vnzw2sQq5fBMVkZm
	 GLYe+AK3iCLuxzQtvdHXH7xnKPRktK4d3InI052ZG+VCjofxY6wBAZpnw2Oe4BeMCC
	 JAkNwF1QgOHv5tQBS0qYl7H64qVYj5JiWHrmmYe0=
Date: Fri, 18 Aug 2023 20:17:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230818171715.GA31744@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
 <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
 <20230817150336.GJ21668@pendragon.ideasonboard.com>
 <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>
 <20230818153045.GB13558@pendragon.ideasonboard.com>
 <cb0270b1-c39a-457c-b09f-7b7756e616d5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb0270b1-c39a-457c-b09f-7b7756e616d5@sirena.org.uk>

On Fri, Aug 18, 2023 at 05:23:09PM +0100, Mark Brown wrote:
> On Fri, Aug 18, 2023 at 06:30:45PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 17, 2023 at 07:41:43PM +0200, Miguel Ojeda wrote:
> 
> > > No, it does not. The point is that you don't need to point out trivial
> > > mistakes anymore, nor devote time to find them.
> 
> > > Just by judging the length of the bot's reply and the importance of
> > > the spotted issues, you can make an assessment.
> 
> > But you'll still need to reply to the submitter to tell what to expect.
> > As far as I understand, this was considered enough of an issue by Greg
> > to be automated to remove even the human need to push a button, see
> > https://github.com/gregkh/gregkh-linux/blob/master/forms/patch_bot.
> 
> I have a bunch of template mails like that too.  One of them includes a
> general suggestion to fix issues from existing reviews, including bot
> output.

Do you have any automated way to send some of those mails, or is it
always manual ?

-- 
Regards,

Laurent Pinchart

