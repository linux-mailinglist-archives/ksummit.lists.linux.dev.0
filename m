Return-Path: <ksummit+bounces-2400-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2BAB59EFF
	for <lists@lfdr.de>; Tue, 16 Sep 2025 19:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F5D1C01141
	for <lists@lfdr.de>; Tue, 16 Sep 2025 17:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A45E2FFFAA;
	Tue, 16 Sep 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="pHlnWinw"
Received: from va-1-16.ptr.blmpb.com (va-1-16.ptr.blmpb.com [209.127.230.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126172FFF93
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042784; cv=none; b=IH1+HdrLsEyiz03Rxx/kV8t7pWKW1RBBn2MoJdItT1zuLS9zRzhQxUhFqis5/bl03DPpRBkfz/1Sf8a/ZPCCOjFJUN7XdfncqziECMLFdaA/MWG2merRZApdorv4hN1Mr6JIMf8isYkDZDTYxsXv+tfUFOqqnZUl/KsW/FuJKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042784; c=relaxed/simple;
	bh=wVrJ/n8b04S2UmL6dEa/C9PdEgOf/B65pja03uGWbvY=;
	h=Date:In-Reply-To:References:From:Subject:Mime-Version:To:
	 Message-Id:Content-Type:Cc:Content-Disposition; b=Skk8qGmggtmpIa6z62GvKy1oQH6N6eoVsvfMmCqOa/lWwBtFs+FQYvs3Q1JsKbXkMi2t02PrkBdpw2d5vNLSRDwv/HMPWfR4MWI50aF2qUuCzLcSHODOy5vrGfOZ/F60h+C4JLsZoCsfZBDNr9m+B3dnOxG9V1nzVMwkXtSDFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=pHlnWinw; arc=none smtp.client-ip=209.127.230.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1758042771;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iw+n0PK+fHCf9KwoXOswBGhkTcTklA/X3X5txeJDNno=;
 b=pHlnWinwFtu83zxl3hfx8YZX5C/juTcg69CziHrRJ5fbHcN46/7A96+tqKA5wUAnJSG6hi
 vIJDXl4Md1Au5peDqqZnM/n3EESBqTgQeGcCrAUcpctI7DfjMzlPTgivjUAdw/N3j9hfNj
 m/IMqnwaYTuxSpCLxSO5XR0uSmmn15GeXSIlntZNyb6ZZRM0l0LMK/CDhg+9VP5IkFDsTe
 mwIkc+Cxgcr/Ku3UZAq39keQkU4TUCtuYtW8bl9LojaANtLRLJFvpB/2YYgPCVabpwcbDc
 Jp7BxWiBE7v+lCZ1MDL//akDn8WRfd1+ArkzQ2aiz/6qyrMI4r8eycPjMVQJCw==
Date: Wed, 17 Sep 2025 01:12:48 +0800
In-Reply-To: <CAHC9VhR0RU+AfhJEZnA2=7CSZhWYTMB5CdbE9BfGoTbYBP9Rnw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com> <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl> <20250908113934.1a31423a@gandalf.local.home> <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com> <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org> <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com> <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp> <CAHC9VhR0RU+AfhJEZnA2=7CSZhWYTMB5CdbE9BfGoTbYBP9Rnw@mail.gmail.com>
From: "Coly Li" <colyli@fnnas.com>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+268c99a91+d20970+lists.linux.dev+colyli@fnnas.com>
X-Original-From: Coly Li <colyli@fnnas.com>
To: "Paul Moore" <paul@paul-moore.com>
Message-Id: <s5e5xf2f4svjc6wd6rn6t2h3nxt2egrn63zqx7tfe4ch3rhuc7@vganh63433hd>
Received: from studio.local ([120.245.65.32]) by smtp.feishu.cn with ESMTPS; Wed, 17 Sep 2025 01:12:49 +0800
Content-Type: text/plain; charset=UTF-8
Cc: "Randy Dunlap" <rdunlap@infradead.org>, 
	"Steven Rostedt" <rostedt@goodmis.org>, "Jan Kara" <jack@suse.cz>, 
	<ksummit@lists.linux.dev>
Content-Disposition: inline

On Wed, Sep 10, 2025 at 03:11:55PM +0800, Paul Moore wrote:
> On Wed, Sep 10, 2025 at 9:32=E2=80=AFAM Coly Li <colyli@fnnas.com> wrote:
> > On Mon, Sep 08, 2025 at 09:03:24PM +0800, Paul Moore wrote:
>=20
> ...
>=20
> > > I can't say I'm familiar with the RichACL concept, but generally
> > > speaking yes, the LSM framework exists as a way to implement access
> > > control mechanisms beyond the traditional Linux access controls (othe=
r
> > > things too, but those aren't really relevant here).
> >
> > Is it convenient for normal users or non-root processes (including the =
policy agent) to
> > setup the LSM rules? We need to allow normal users to set their own acc=
ess control policy
> > for the data they owned.
>=20
> Management of an individual LSM's configuration is generally left to
> the individual LSM.  Some LSMs restrict their configuration knobs
> behind capabilities or their own access controls, while others allow
> unprivileged access to the configuration; it depends on the LSM's
> security model.  As an unprivileged example, Landlock allows
> applications, run by arbitrary users, to set their own Landlock
> security policy via the Landlock API.
>=20

I forward the suggestion to our application team, and they try to evaluate
and replied the result.

Currently they are using bpf to do the access control rules checking, and
LSM access control method e.g. Landlock is quite similar to a rules based
control method. They still need to persist all the rules on disk, and load
the rules during system initlization time. When the number of rules increas=
ed,
the maintennance is complicated and slow.

Also the application team give me a use case, ask how to achieve the access
control effiently. Let me describe by the followed text.

Users store they photos on the system, and the compact AI module processes =
all
their photos and groups all the photos into different categories like pizza=
,
dogs, cats, foods or group photos. After the process done, users may see th=
ey
photos in different categories that the AI module thinks they should be in.=
 Then
users may share the categories with photos to others. If indentical categor=
ies
shared by different users, the shared photos can be combined all together. =
And
AI module may continue to process the shared photos and generate new catega=
ries
from the shared photos, e.g. pizza in the same city, cats and dogs in close=
d
location, group photos contains the most common people, etc. Now the differ=
et
categories are implemented by different directories in the publicly shared
directory.

In each category directory, photos with a category (or attribution) can be
accessed as hard links to the original photo inodes and share the identical
inodes. All these category directories are created by the AI module, althou=
gh
the photos are shared from each users. If a user is identified from a group
photo, and this user is noticed that the photo is publicly shared. If this =
user
doesn't want his face to be shared in public, for an optinal privacy protec=
tion
right, this user can remove the hardlink of the photo which his or her face=
 is
in, that is he or she can remove the hardlink (dentry) under a publicly sha=
red
directory which this user doesn't have write permission. Because this user =
can
be idnetified as owner of his or her face, and the photo has his face in, h=
e or
she should have write permission to delete the photo, but no write permissi=
on to
other photos in same category directioy which his or her face is not in.

The above example is one of the simple case just for photos processing and
sharing in the AI context. The rules of access control are created or desto=
ried
dynamically and maybe only exist for a short period. And the number of rule=
s are
quite large.

Current rules based access control is inefficient and complicated to implem=
ent
for the above simple case, and the application team replies they don't see =
the
rules based LSM method can make it be more simple.

> > Also there is a special case, e.g. a file=E2=80=99s parent directory do=
esn=E2=80=99t allow write
> > permission, but the file needs to grant delete permission.
> > 4614 int do_unlinkat(int dfd, struct filename *name)
> > 4615 {
> > [snipped]
> > 4645                 inode =3D dentry->d_inode;
> > 4646                 ihold(inode);
> > 4647                 error =3D security_path_unlink(&path, dentry);
> > 4648                 if (error)
> > 4649                         goto exit3;
> > 4650                 error =3D vfs_unlink(mnt_idmap(path.mnt), path.den=
try->d_inode,
> > 4651                                    dentry, &delegated_inode);
> > [snipped]
> > 4563 int vfs_unlink(struct mnt_idmap *idmap, struct inode *dir,
> > 4564                struct dentry *dentry, struct inode **delegated_ino=
de)
> > 4565 {
> > 4566         struct inode *target =3D dentry->d_inode;
> > 4567         int error =3D may_delete(idmap, dir, dentry, 0);
> > 4568
> > 4569         if (error)
> > 4570                 return error;
> > [snipped]
> >
> > It seems in do_unlinkat() the security check security_path_unlink() is =
called before
> > calling may_delete() inside vfs_unlink(). So even security rule permits=
 to delete
> > this file but the parent directory doesn't grant write permission, such=
 access control
> > still cannot be archieved.
>=20
> One of the important parts of the LSM framework as a whole is that
> LSMs can not grant access that would otherwise be blocked by the
> standard/discretionary access controls built into the Linux kernel; in
> other words, LSMs can only say "no" to an access, they can not grant
> access by themselves.  Yes, this is by design, and no, I see no reason
> to change that design decision at this point in time (doing so would
> require a tremendous amount of work and likely introduce a fair number
> of security regressions for quite some time).

I understand and agree the concern of security. But the reality is more and=
 more
similar or relative access control requirements will sprint up from the AI/=
LLM
applications and use cases. We just want to solve the access control challe=
nge,
and the LSM rules based methods are not easy for application developers.

Forgive me for the late response, because I wait for the feed back from our
application development teams.

Thanks.

Coly Li

