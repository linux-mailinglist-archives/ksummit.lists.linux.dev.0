Return-Path: <ksummit+bounces-193-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2E3A3ED8
	for <lists@lfdr.de>; Fri, 11 Jun 2021 11:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0F5783E0FA0
	for <lists@lfdr.de>; Fri, 11 Jun 2021 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640A72FBF;
	Fri, 11 Jun 2021 09:13:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C772
	for <ksummit@lists.linux.dev>; Fri, 11 Jun 2021 09:13:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E431D60FDA;
	Fri, 11 Jun 2021 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623402794;
	bh=0Tv6dk09LYXtiWu3+YyS09NcTBZcnmopruN7Ttw2A3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qCE0A2hE5eLvV8SAX8VsVaLsmx7G+YhwHIGuIbtiETIq98w68vFvtv3s1bhzDjAJ1
	 zAwEklDt1RkuJy4xO1mhyVGn5CoqoCJlfqGcOzbWGGdCb/cl21ED/qg6om4QDr6Qgw
	 hAsXyCGbL1jtQZUE1mmW8Fz57Pe8pBJAijmfw+8qSkasiv7gs8Bn4yv5Nf3uQnoBiX
	 zxb7Zjkljrgndxxd99Pyb9NRcFNuEpikSsPzNHA+8Ye4WGjHy7LoVAmriVbgeAzAuX
	 sIG1CoqZMtlY/m4KJAESInsxp1yQtkOqy6u3nFjtUmy8jmmfx5n/O/lOLN4k8Jv3p4
	 6ODFKkgxpj1ug==
Date: Fri, 11 Jun 2021 11:13:07 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Enrico Weigelt, metux IT consult"
 <lkml@metux.net>, David Hildenbrand <david@redhat.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Greg KH <greg@kroah.com>,
 Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o" <tytso@mit.edu>, Jiri
 Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210611111248.250e6da8@coco.lan>
In-Reply-To: <20210611025942.GE25638@1wt.eu>
References: <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	<YK+esqGjKaPb+b/Q@kroah.com>
	<c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	<b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	<5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	<20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	<YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
	<20210610152633.7e4a7304@oasis.local.home>
	<37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
	<87tum5uyrq.fsf@toke.dk>
	<20210611025942.GE25638@1wt.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 11 Jun 2021 04:59:42 +0200
Willy Tarreau <w@1wt.eu> escreveu:

> On Fri, Jun 11, 2021 at 12:43:05AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
> > Shuah Khan <skhan@linuxfoundation.org> writes: =20
> > > I have a
> > > couple of ideas on how we might be able to improve remote experience
> > > without restricting in-person experience.
> > >
> > > - Have one or two moderators per session to watch chat and Q&A to ena=
ble
> > >    remote participants to chime in and participate.
> > > - Moderators can make sure remote participation doesn't go unnoticed =
and
> > >    enable taking turns for remote vs. people participating in person.
> > >
> > > It will be change in the way we interact in all in-person sessions for
> > > sure, however it might enhance the experience for remote attendees. =
=20
> >=20
> > This is basically how IETF meetings function: At the beginning of every
> > session, a volunteer "jabber scribe" is selected to watch the chat and
> > relay any questions to a microphone in the room. And the video streaming
> > platform has a "virtual queue" that remove participants can enter and
> > the session chairs are then responsible for giving people a chance to
> > speak. Works reasonably well, I'd say :) =20
>=20
> I was about to say the same. In addition, local participants line up
> at a microphone and do not interrupt the speaker, but the organiser
> gives them the signal to ask a question. This allows to maintain a
> good balance between local and remote participants. Also it's common
> to see some locals go back to their seat because someone else just
> asked the same question. And when remote questions are asked using
> pure text, it's easy for the organiser to skip them if already
> responded as well.
>=20
> This method is rather efficient because it doesn't require to keep the
> questions for the end of the session, yet questions do not interrupt
> the speaker. It also solves the problem of people not speaking in the
> microphone. The only thing is that it can be quite intimidating for
> local participants who are too shy of standing up in front of a
> microphone and everyone else.

If someone is shy, he/she could simply type the question as a
remote participant would do.

This should work fine for a normal speech, but for BoFs and the
usual "round table" discussions we have at Kernel Maintainers,
this may not work well for local participants.

I guess that, for such kind of discussions, I can see two
possible alternatives:

1. everyone would use their laptop cameras/mics;
2. every round table would have their on camera/mic set.

(1) is probably simpler to implement, but may provide a worse
experience for local participants. (2) is probably harder to
implement, as the usual conference logistics company may not
have cameras.

In either case, a moderator (or some moderating software) is needed
in order queue requests for speech. So, basically, when someone
(either in a table or remote) wants to speak, it adds its name to
a queue, which will then be parsed at the queue's order. This is not
as natural as a physical meeting, but I guess it won't bring too
much burden to local people.

Thanks,
Mauro

