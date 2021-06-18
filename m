Return-Path: <ksummit+bounces-204-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FB3ACD3B
	for <lists@lfdr.de>; Fri, 18 Jun 2021 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3F24B3E1171
	for <lists@lfdr.de>; Fri, 18 Jun 2021 14:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6C42FB1;
	Fri, 18 Jun 2021 14:11:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531770
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 14:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1B3951280241;
	Fri, 18 Jun 2021 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624025506;
	bh=4LBN5ONxoCRCcmkd/3TRY+Leu8+Z6eiVOBBAW6jThCc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ZOOaW8e7cDpvpBw4NDkdSQvvjKr3Tv3PpC3/84PPPXnDUohCTNaNIapIEV+QfwMMm
	 MZ+qtKH6hkBXEtHHI9vrWTnL23mrzQhufRG7QTGP+P/f0yKe9SdYAMliHBYKYNy+lW
	 0XkClXMLWyc+4x0i+eb5prohIqKqCYPH/QRUBqdU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef-HQXDtiAdB; Fri, 18 Jun 2021 07:11:46 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2D3291280021;
	Fri, 18 Jun 2021 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624025505;
	bh=4LBN5ONxoCRCcmkd/3TRY+Leu8+Z6eiVOBBAW6jThCc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=v5gjcRptKODpU0+TvxfBTk18Wz6cYOSQVqInEBg1CDw6wSl8BJsxg+4zb6b6L20t5
	 Lf8hlOhryE6RTc778UvZDG1QLVK7TdwD1HsZ151o8S3/idPjYz1589NX7jhpLKl6ND
	 PThgRTXDcqRWz6DK7IMwg9PXztNLVgRtFstqTJCE=
Message-ID: <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shuah Khan
	 <skhan@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Enrico Weigelt, metux IT consult"
 <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH
 <greg@kroah.com>,  Christoph Lameter <cl@gentwo.de>, Theodore Ts'o
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,  ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org,  linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,  netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Date: Fri, 18 Jun 2021 07:11:44 -0700
In-Reply-To: <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
References: <YIx7R6tmcRRCl/az@mit.edu>
	 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	 <YK+esqGjKaPb+b/Q@kroah.com>
	 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
	 <20210610152633.7e4a7304@oasis.local.home>
	 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
	 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-18 at 16:46 +0300, Laurent Pinchart wrote:
> For workshop or brainstorming types of sessions, the highest barrier
> to participation for remote attendees is local attendees not speaking
> in microphones. That's the number one rule that moderators would need
> to enforce, I think all the rest depends on it. This may require a
> larger number of microphones in the room than usual.

Plumbers has been pretty good at that.  Even before remote
participation, if people don't speak into the mic, it's not captured on
the recording, so we've spent ages developing protocols for this. 
Mostly centred around having someone in the room to remind everyone to
speak into the mic and easily throwable padded mic boxes.  Ironically,
this is the detail that meant we couldn't hold Plumbers in person under
the current hotel protocols ... the mic needs sanitizing after each
throw.

James



