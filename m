Return-Path: <ksummit+bounces-2317-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9AB5183C
	for <lists@lfdr.de>; Wed, 10 Sep 2025 15:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1040A1C8315F
	for <lists@lfdr.de>; Wed, 10 Sep 2025 13:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189B01F5847;
	Wed, 10 Sep 2025 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="jBM0NdLG"
Received: from sg-1-17.ptr.blmpb.com (sg-1-17.ptr.blmpb.com [118.26.132.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D641F4E34
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512035; cv=none; b=OaLOhw8VI9sRK5wgSCjZw8gtITvENNbeYQyAwK5ydyyvfUgyPuaBk3+gbYxvHO3bjzyikIo7EYKsldp//5oVC8evfcF+OqTghsqeXPNxiK0+RZIRl9mX/sjqVlb6/S3t1djQirjho2F3zaEOawlfTJZioaLKDB37VSY97tcrqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512035; c=relaxed/simple;
	bh=VsfmcU5DkgC2r1If3lk54eR9UTLvNaZWy/jjW0lZLOc=;
	h=To:Message-Id:Content-Type:Content-Disposition:From:Mime-Version:
	 References:Cc:Subject:Date:In-Reply-To; b=Tu/9OZVznpmgDViSJ8VX3D0qNFPadkKZh/zUIV/L2U0Vok8MM8iImz8DLkUJmg/zrj1Z4uYP2ZRIzpff5zLCMK5bvWx4YpZSttSL25M7XrZHDssf6sM/J+8NyARIwnwE8umFL8e4byZkV5SYf50epV5EHez6bo28XAbLhiPSDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=fail smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=jBM0NdLG; arc=none smtp.client-ip=118.26.132.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1757511136;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=QX3BKu2u+WXbfhbdzlaCYaFyA4K4VFCDqDnDQqREGas=;
 b=jBM0NdLGk84WOfngBYJTtHzn6tYNzZkpIenB3/Gqlbkd9Bbjctg4Rje4IlLTpGcVMkPS9+
 eJz9DTpWVTZLdwYVR9KiR8LpNkAGNiPw3fS7GwMTyPAqb8+ExzRYunqTUci8V64yWyRNnp
 vAH393JuYo6EbJ8FDPOGi6SyVhlN9koHUa39uqISLvcKo7mWjMLKFCrL/AtM0nCYJQgnbz
 FRzJcbAwjauOFm6J7OBAMkPznmvasTBK3hmgeclL1pR/oQdYAMNIf3BJwJ38dJxg3UOD3F
 CpG4wlJ2RRzlHYjdPp8uoEE6Ts3kHQpSQARTR69hr6evuFuVMwni8ZWSMO7V4A==
To: "Paul Moore" <paul@paul-moore.com>
Message-Id: <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp>
X-Original-From: Coly Li <colyli@fnnas.com>
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
From: "Coly Li" <colyli@fnnas.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com> <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl> <20250908113934.1a31423a@gandalf.local.home> <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com> <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org> <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+268c17dde+361876+lists.linux.dev+colyli@fnnas.com>
Cc: "Randy Dunlap" <rdunlap@infradead.org>, 
	"Steven Rostedt" <rostedt@goodmis.org>, "Jan Kara" <jack@suse.cz>, 
	<ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Date: Wed, 10 Sep 2025 21:32:11 +0800
Received: from studio.local ([120.245.64.195]) by smtp.feishu.cn with ESMTPS; Wed, 10 Sep 2025 21:32:13 +0800
In-Reply-To: <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>

On Mon, Sep 08, 2025 at 09:03:24PM +0800, Paul Moore wrote:
> On Mon, Sep 8, 2025 at 7:23=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> > On 9/8/25 8:42 AM, Coly Li wrote:
> > >> 2025=E5=B9=B49=E6=9C=888=E6=97=A5 23:39=EF=BC=8CSteven Rostedt <rost=
edt@goodmis.org> =E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >>>
> > >>> I'm not really on program committee for either a Maintainers summit=
 or LPC
> > >>> so take this just as a friendly advice from a bystander :)
> > >>>
> > >>
> > >> As Jan has stated, this is a technical topic. But you can send it to=
 this
> > >> list too. From Ted's original email:
> > >>
> > >>    Related to the Maintainer's Summit, the Kernel Summit is organize=
d as
> > >>    a track which is run in parallel with the other tracks at the Lin=
ux
> > >>    Plumbers Conference (LPC), and is open to all registered attendee=
s of
> > >>    LPC.  The goal of the Kernel Summit track will be to provide a fo=
rum
> > >>    to discuss specific technical issues that would be easier to reso=
lve
> > >>    in person than over e-mail.  The program committee will also cons=
ider
> > >>    "information sharing" topics if they are clearly of interest to t=
he
> > >>    wider development community (i.e., advanced training in topics th=
at
> > >>    would be useful to kernel developers).
> > >>
> > >>    To suggest a topic for the Kernel Summit, please do two things. b=
y
> > >>    September 10th, 2025. First, please send e-mail with a subject pr=
efix of
> > >>    [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a=
 separate
> > >>    e-mail for each topic.
> > >>
> > >>    Secondly, please create a topic at the Linux Plumbers Conference
> > >>    proposal submission site and target it to the Kernel Summit track=
:
> > >>
> > >>        https://lpc.events/event/19/abstracts
> > >>
> > >>    Please do both steps.  I'll try to notice if someone forgets one =
or
> > >>    the other, but your chances of making sure your proposal gets the
> > >>    necessary attention and consideration are maximized by submitting=
 both
> > >>    to the mailing list and the web site.
> > >>
> > >>
> > >> The CfP is closing this Wednesday, so please submit it soon.
> > >
> > > Yes, I already submitted the CfP on https://lpc.events/event/19/abstr=
acts and got the confirmation email.
> > >
> > > Also I resend another proposal email subjected with  [TECH TOPIC]  an=
d almost identical message body.
> > >
> > > Thanks for the hint!
> >

Hi Paul and Randy,

Thank you for suggesting LSM as another choice.=20

> > Hi,
> > I don't object to such a topic, but I thought that LSMs were the wave
> > of the future for extended attributes or special capability handling.  =
?
>=20
> I can't say I'm familiar with the RichACL concept, but generally
> speaking yes, the LSM framework exists as a way to implement access
> control mechanisms beyond the traditional Linux access controls (other
> things too, but those aren't really relevant here).

Is it convenient for normal users or non-root processes (including the poli=
cy agent) to
setup the LSM rules? We need to allow normal users to set their own access =
control policy
for the data they owned.

Also there is a special case, e.g. a file=E2=80=99s parent directory doesn=
=E2=80=99t allow write
permission, but the file needs to grant delete permission.
4614 int do_unlinkat(int dfd, struct filename *name)
4615 {
[snipped]
4645                 inode =3D dentry->d_inode;
4646                 ihold(inode);
4647                 error =3D security_path_unlink(&path, dentry);
4648                 if (error)
4649                         goto exit3;
4650                 error =3D vfs_unlink(mnt_idmap(path.mnt), path.dentry-=
>d_inode,
4651                                    dentry, &delegated_inode);
[snipped]
4563 int vfs_unlink(struct mnt_idmap *idmap, struct inode *dir,
4564                struct dentry *dentry, struct inode **delegated_inode)
4565 {
4566         struct inode *target =3D dentry->d_inode;
4567         int error =3D may_delete(idmap, dir, dentry, 0);
4568
4569         if (error)
4570                 return error;
[snipped]

It seems in do_unlinkat() the security check security_path_unlink() is call=
ed before
calling may_delete() inside vfs_unlink(). So even security rule permits to =
delete
this file but the parent directory doesn't grant write permission, such acc=
ess control
still cannot be archieved.

We are open to any possible method to serve the complicated access controls=
 in current
AI/LLM driven workloads. And the executive team decide to invest a few engi=
neers and time
to work with other community deveopers on the promissing technial choice, a=
nd help to make
the effort to go into upstream kernel. Therefore we do want to hear all you=
r voices and
advices, to make sure the effort will be on the correct tack.

Thanks again for your replies.

Coly Li

