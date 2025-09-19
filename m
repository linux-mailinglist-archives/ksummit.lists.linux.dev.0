Return-Path: <ksummit+bounces-2415-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9CB8817B
	for <lists@lfdr.de>; Fri, 19 Sep 2025 09:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037D37A822A
	for <lists@lfdr.de>; Fri, 19 Sep 2025 07:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABFC283FD0;
	Fri, 19 Sep 2025 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="HjIwOpqO"
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1A2512C8
	for <ksummit@lists.linux.dev>; Fri, 19 Sep 2025 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758265540; cv=none; b=aEzWST8hisx5BiwQP2eajoZKsPasniA+HfOiQoW8mTQutjTOmEsy1YMES5unxh5Ps6WAMRULezhh8Npx5CKOKllDvEwBxHhajjjsQub7kcsVyCG1eJH0VPRyCE6iCcsxhkaP/xo9Q24tDGbrjtRwJq1AJv1FK6Mjks+WTYIb8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758265540; c=relaxed/simple;
	bh=z381LgLQ5mfj6F9wVZkKFulpE472UJgzCM2nBeIiGt0=;
	h=From:Date:Content-Type:Message-Id:Content-Disposition:
	 Mime-Version:To:Cc:Subject; b=dAp1S3MW/BxX4cv1a8PCgTuIo2A/JSlOgJ9fbIkbvua1jssLvH1oiGGUD6jh6PgV+p/1vOpaz2h+utKpbB93jj9+Ooy4o5TyNkGVXC6tXGXEJjiPoWgjJtwPwozL67Xew1RQSHB7A4FUK3haA4LZ7m9vIgloOuuV1eF+3UrOYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=fail smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=HjIwOpqO; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1758262583;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=7sGSZ6xvXVhJXfnKBh55VvSGliodbz+oixpp80FGbCI=;
 b=HjIwOpqOMfp2sAI9SV+UZjSp+gUMPFp3fJ/DPDQk97/7CqRMuTG6sLia8I0OUmnn2XXoMz
 bm4HIO7O/fk0+uJ2cMxbnw0TwPUYAkz3q95H+2yLDvSJol8MZ7Ws84qQ17k1zLO0tti1jr
 b06MhPGLHoGDwXMdU/53XkufQoXak8zccsgkW8SnBkFhbQmA7IlYstHadf4mnTZMwdJnB+
 /eni18aaxJ74ksv7GzKxpkwMUJD7yZiz5c7AO31L9YXv1tXWyfhGNpDVKiXInSXEEpN6Az
 vsfiQ7i/9vhAe1AN1coJLNv6ukguDLCUSw/7Dq3W1fa3nZ2Kop5rrk5hRWG4Pg==
X-Original-From: Coly Li <colyli@fnnas.com>
From: "Coly Li" <colyli@fnnas.com>
Date: Fri, 19 Sep 2025 14:16:19 +0800
Content-Type: text/plain; charset=UTF-8
Message-Id: <uloh2zdsl3aahiplt35vrzs53syrqu3wsf6qbvrfhcyxd6d3ae@zqqbsqzyaonb>
Content-Disposition: inline
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "Jan Kara" <jack@suse.cz>
Cc: "Paul Moore" <paul@paul-moore.com>, 
	"Randy Dunlap" <rdunlap@infradead.org>, 
	"Steven Rostedt" <rostedt@goodmis.org>, <ksummit@lists.linux.dev>
X-Lms-Return-Path: <lba+268ccf535+d63e86+lists.linux.dev+colyli@fnnas.com>
Subject: Re: [TECH TOPIC] re-think of richACLs in AI/LLM era
Received: from studio.lan ([120.245.65.32]) by smtp.feishu.cn with ESMTPS; Fri, 19 Sep 2025 14:16:20 +0800

On Wed, Sep 17, 2025 at 09:59:09AM +0800, Jan Kara wrote:
> On Wed 17-09-25 01:12:48, Coly Li wrote:
> > Users store they photos on the system, and the compact AI module processes all
> > their photos and groups all the photos into different categories like pizza,
> > dogs, cats, foods or group photos. After the process done, users may see they
> > photos in different categories that the AI module thinks they should be in. Then
> > users may share the categories with photos to others. If indentical categories
> > shared by different users, the shared photos can be combined all together. And
> > AI module may continue to process the shared photos and generate new categaries
> > from the shared photos, e.g. pizza in the same city, cats and dogs in closed
> > location, group photos contains the most common people, etc. Now the differet
> > categories are implemented by different directories in the publicly shared
> > directory.
> > 
> > In each category directory, photos with a category (or attribution) can be
> > accessed as hard links to the original photo inodes and share the identical
> > inodes. All these category directories are created by the AI module, although
> > the photos are shared from each users. If a user is identified from a group
> > photo, and this user is noticed that the photo is publicly shared. If this user
> > doesn't want his face to be shared in public, for an optinal privacy protection
> > right, this user can remove the hardlink of the photo which his or her face is
> > in, that is he or she can remove the hardlink (dentry) under a publicly shared
> > directory which this user doesn't have write permission. Because this user can
> > be idnetified as owner of his or her face, and the photo has his face in, he or
> > she should have write permission to delete the photo, but no write permission to
> > other photos in same category directioy which his or her face is not in.
> 
> Well, from what you describe I'd say that the category directories should
> just be AI owned rwxrwxrwt dirs (do notice the sticky bit set). This is how
> /tmp/ is usually setup. This means that everybody can read the dir,
> everybody can delete files but only if they are their owner, everybody can
> create files - this is the part you probably don't want but *that* is
> pretty easy to restrict by a LSM (practically any one can do this).

This is quite similar to what we are doing now (self-define rules + ebpf hooks)
but your suggestion might be in a more elegant way.

By the above method, our challenges are,
- Application may treat this behavior as a bug
    Once the write/delete access is denied, user application cann't understand
  why the request was rejected. User space application can check permission bits
  and acl, but cannot check the LSM rules, they cannot understand why all
  permission granted but the write/delete access is rejected.
    Currently in our products it is fine, because all applications are written
  by ourself, we know the access deny is from the security rules voilation. But
  in long term this might be a potential challenge.

- Cannot tell the real permission fastly
    From web UI interface, users can click the mouse right button to check his
  or her permission of this specific file or directory. Our current rules-based
  access control needs to reverse iterate all the rules to determine the final
  permission which the user obtains. It is very slow and inconvenient, and we
  don't have proper method to handle the permission display yet.

- Rules store/load/management
    Crrently all the rules are persisted in data base and loaded into in-kernel
  memory table. The rules can be checked very fast and works fine for relative
  small data set and access rules at this moment. But in worst case maybe each
  sharedfile will have a signle rule for its access control, when number of
  shared files and control policies increase more and more, such method doesn't
  scale and is not agile in store/load/management very soon.

This is view from users (both user space developers and end users). Currently I
don't see perfect solution with LSM may solve challenge from view of users.

Thanks for your suggestion.

Coly Li

